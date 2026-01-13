import 'package:data/local/shared_preference/entity/subscription_shared_pref_entity.dart';
import 'package:domain/enum/redirect_page.dart';
import 'package:domain/enum/subscription_bill.dart';
import 'package:domain/enum/subscription_level.dart';
import 'package:domain/model/skyClubModels/subscription_state.dart';
import 'package:domain/model/skyClubModels/subscription_type_domain.dart';
import 'package:domain/model/skyClubModels/user_subscription_domain.dart';
import 'package:domain/repository/reward_repository.dart';
import 'package:domain/util/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:sky_club/presentation/base/base_viewmodel.dart';
import 'package:sky_club/presentation/feature/payment_web_view/route/payment_web_view_argument.dart';
import 'package:sky_club/presentation/feature/payment_web_view/route/payment_web_view_route.dart';
import 'package:sky_club/presentation/feature/skybase/reward/page/subscription_cancel/route/subscription_cancel_argument.dart';
import 'package:sky_club/presentation/feature/skybase/reward/page/subscription_cancel/route/subscription_cancel_route.dart';
import 'package:sky_club/presentation/feature/skybase/reward/route/reward_argument.dart';
import 'package:sky_club/presentation/localization/ui_text.dart';
import 'package:sky_club/presentation/util/value_notifier_list.dart';

class RewardViewModel extends BaseViewModel<RewardArgument> {
  final RewardRepository repository;

  final ValueNotifier<SubscriptionBill> _subscriptionBill =
      ValueNotifier(SubscriptionBill.monthly);
  ValueNotifier<SubscriptionBill> get subscriptionBill => _subscriptionBill;

  final ValueNotifier<SubscriptionBill?> _selectedSubscriptionBill =
      ValueNotifier(null);
  ValueNotifier<SubscriptionBill?> get selectedSubscriptionBill =>
      _selectedSubscriptionBill;

  final ValueNotifier<SubscriptionLevel?> _selectedSubscriptionLevel =
      ValueNotifier(SubscriptionLevel.standard);
  ValueNotifier<SubscriptionLevel?> get selectedSubscriptionLevel =>
      _selectedSubscriptionLevel;

  DateTime? expiryDate;

  ValueNotifier<SubscriptionState?> subscriptionState = ValueNotifier(null);

  ValueNotifier<UserSubscriptionDomain?> userSubscription = ValueNotifier(null);

  final ValueNotifier<bool> _isSubCancelled = ValueNotifier(false);
  ValueNotifier<bool> get isSubCancelled => _isSubCancelled;

  final ValueNotifier<bool> _wantUpgrade = ValueNotifier(false);
  ValueNotifier<bool> get wantUpgrade => _wantUpgrade;

  ValueNotifierList<SubscriptionTypeDomain> subscriptionTypeList =
      ValueNotifierList([]);
  ValueNotifierList<SubscriptionTypeDomain> currentSubscriptionList =
      ValueNotifierList([]);

  RewardViewModel({required this.repository}) {
    // _loadSubscriptionState();
  }

  @override
  void onViewReady({RewardArgument? argument}) {
    super.onViewReady();
    getSubscriptionStatus();
  }

  @override
  void onDispose() {
    super.onDispose();
    _subscriptionBill.dispose();
    _selectedSubscriptionLevel.dispose();
    subscriptionState.dispose();
    _wantUpgrade.dispose();
    _isSubCancelled.dispose();
    userSubscription.dispose(); // Add this line
    subscriptionTypeList.dispose(); // Add this line
    currentSubscriptionList.dispose(); // Add this line
  }

  void updateSubscriptionBill(SubscriptionBill bill) {
    _subscriptionBill.value = bill;
    _updateCurrentSubscriptionList();
  }

  Future<void> updateSelectedSubscriptionLevel(SubscriptionLevel level) async {
    _selectedSubscriptionLevel.value = level;
  }

  // Future<void> _loadSubscriptionState() async {
  //   final SubscriptionState response = await loadData(() => repository.fetchSubscriptionState());
  //   subscriptionState.value = response;
  // }

  // Future<void> updateSubscription(bool isSubscribed,
  //     DateTime? subscriptionDate, DateTime? expiryDate) async {
  //   final newState = SubscriptionState(
  //     isSubscribed: isSubscribed,
  //     subscriptionLevel: selectedSubscriptionLevel.value,
  //     expiryDate: expiryDate,
  //     subscriptionDate: subscriptionDate,
  //     subscriptionBill: subscriptionBill.value,
  //   );
  //
  //   await repository.updateSubscription(subscriptionState: newState);
  //
  //
  //
  //   _loadSubscriptionState();
  //
  // }

  void cancelSub() {
    _isSubCancelled.value = true;
  }

  void resetSubCancelled() {
    _isSubCancelled.value = false;
  }

  void upgradePlan() {
    final String interval = userSubscription.value!.interval;
    _subscriptionBill.value = interval == 'month'
        ? SubscriptionBill.monthly
        : SubscriptionBill.yearly;
    _updateCurrentSubscriptionList();
    _wantUpgrade.value = true;
  }

  void resetUpgradePlan() {
    _wantUpgrade.value = false;
  }

  Future<void> makePayment(
      {required String type, required String interval}) async {
    final String response = await loadData(
        () => repository.makePayment(membershipType: type, interval: interval));

    if (response.isNotEmpty) {
      navigateToScreen(
          destination: PaymentWebViewRoute(
              arguments: PaymentWebViewArgument(
                  checkoutUrl: response, redirectUrl: RedirectPage.subscriptionSuccess)));
    } else {
      showToast(uiText: FixedUiText(text: 'Something went wrong'));
    }
  }

  Future<void> getSubscriptionStatus() async {
    final UserSubscriptionDomain? userSubscriptionDomain =
        await loadData(() => repository.getSubscriptionStatus());
    userSubscription.value = userSubscriptionDomain;

    Logger.debug('User subscription: ${userSubscription.value?.type ?? 'notfound'}');

    final List<SubscriptionTypeDomain> subType =
        await loadData(() => repository.getSubscriptionType());
    subscriptionTypeList.value = subType;

    _updateCurrentSubscriptionList();

    if (userSubscription.value != null) {
      final bool isSubscribed = userSubscription.value!.isActive;

      final SubscriptionState subState =
          SubscriptionState(isSubscribed: isSubscribed);

      subscriptionState.value = subState;
      selectedSubscriptionBill.value =
          userSubscription.value?.interval == 'month'
              ? SubscriptionBill.monthly
              : SubscriptionBill.yearly;
    } else {
      // final List<SubscriptionTypeDomain> subType = await loadData(() => repository.getSubscriptionType());
      final SubscriptionState subState = SubscriptionState(isSubscribed: false);

      subscriptionState.value = subState;
      // subscriptionTypeList.value = subType;
    }
  }

  Future<void> cancelSubscription() async {
    //cancelSub();

    await loadData(() => repository.cancelSubscription(
        subscriptionId: userSubscription.value!.id));

     await getSubscriptionStatus();

    navigateToScreen(destination: SubscriptionCancelRoute(arguments: SubscriptionCancelArgument()));

  }

  void _updateCurrentSubscriptionList() {
    final String interval =
        _subscriptionBill.value == SubscriptionBill.monthly ? 'month' : 'year';
    currentSubscriptionList.value = subscriptionTypeList.value
        .where((subscription) => subscription.interval == interval)
        .toList();
  }

  Future<void> changePlan(
      {required String type, required String interval}) async {
    await loadData(() => makePayment(type: type, interval: interval));
  }
}
