import 'package:domain/model/skyClubModels/offer_domain.dart';
import 'package:domain/model/skyClubModels/travelLocation.dart';
import 'package:domain/repository/explore_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:club_alt/presentation/base/base_viewmodel.dart';
import 'package:club_alt/presentation/feature/explore/route/explore_argument.dart';
import 'package:club_alt/presentation/util/value_notifier_list.dart';

class ExploreViewModel extends BaseViewModel<ExploreArgument> {



  final ExploreRepository repository;

  ValueNotifierList<TravelLocation> travelLocationList = ValueNotifierList<TravelLocation>([]);
  ValueNotifierList<OfferDomain> offerList = ValueNotifierList<OfferDomain>([]);

  ExploreViewModel({required this.repository});

  @override
  void onViewReady({ExploreArgument? argument}) {
    super.onViewReady();
    fetchTopDestinationAndOffers();
  }


  Future<void> fetchTopDestinationAndOffers() async {
    try {
      final List<TravelLocation>? locationList =
      await loadData(() => repository.getTravelLocationList());

      final List<OfferDomain>? offerList =
      await loadData(() => repository.getOfferList());

      if (offerList != null) {
        this.offerList = ValueNotifierList<OfferDomain>(offerList);
      }
      if (locationList != null) {
        travelLocationList = ValueNotifierList<TravelLocation>(locationList);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }



}
