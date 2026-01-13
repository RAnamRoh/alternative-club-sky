import 'dart:math';

import 'package:domain/enum/travel_way.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_club/presentation/base/base_ui_state.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/common_app_bar.dart';
import 'package:sky_club/presentation/common/widget/asset_image_view.dart';
import 'package:sky_club/presentation/feature/skyhome/skyhome_view_model.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/drawer_list.dart';
import 'package:sky_club/presentation/feature/skyhome/widget/flight_date_selector.dart';
import 'package:sky_club/presentation/feature/skyhome/widget/flight_selector.dart';
import 'package:sky_club/presentation/feature/skyhome/widget/multi_city_flight_selector.dart';
import 'package:sky_club/presentation/feature/skyhome/widget/seat_class_drop_down.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class SkyhomeMobilePortrait extends StatefulWidget {
  final SkyhomeViewModel viewModel;

  const SkyhomeMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => SkyhomeMobilePortraitState();
}

class SkyhomeMobilePortraitState extends BaseUiState<SkyhomeMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: _buildBody(context),
      drawer: const Drawer(
        child: DrawerList(
          currentScreen: RoutePath.skyhome,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SizedBox(
        width: screenWidth, // Takes full screen width
        child: Column(
          children: [
            valueListenableBuilder(
              listenable: widget.viewModel.showEmailBanner,
              builder: (context, value) {
                return value
                    ? Container(
                        height: screenHeight * 0.1,
                        width: screenWidth,
                        // Full width
                        color: Colors.yellow,
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimens.dimen_10.w,
                            vertical: Dimens.dimen_10.h),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // Align text to the start (left)
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Verify Your Email Address',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.w600,
                                            fontSize: Dimens.dimen_12,
                                          ),
                                    ),
                                    Text(
                                      'Your Email is not verified yet. \nPlease check your inbox for the verification link.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Dimens.dimen_10,
                                          ),
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Dimens.dimen_20,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  widget.viewModel.onClickVerificationButton();
                                },
                                color: Theme.of(context).colorScheme.primary,
                                child: Text(
                                  'Resend Verification Mail',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: Dimens.dimen_12,
                                      ),
                                ),
                              ),
                            ]),
                      )
                    : const SizedBox.shrink();
              },
            ),
            valueListenableBuilder(
              listenable: widget.viewModel.showPhoneBanner,
              builder: (context, value) {
                return value
                    ? Container(
                        height: screenHeight * 0.1,
                        width: screenWidth,
                        // Full width
                        color: Colors.yellow,
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimens.dimen_10.w,
                            vertical: Dimens.dimen_10.h),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // Align text to the start (left)
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Verify Your Phone Number',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.w600,
                                            fontSize: Dimens.dimen_12,
                                          ),
                                    ),
                                    Text(
                                      'Your phone number is not verified yet. Please check your inbox and submit the OTP',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Dimens.dimen_10,
                                          ),
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Dimens.dimen_20,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  widget.viewModel.onClickSendOTPButton();
                                },
                                color: Theme.of(context).colorScheme.primary,
                                child: Text(
                                  'Resend OTP',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: Dimens.dimen_12,
                                      ),
                                ),
                              ),
                            ]),
                      )
                    : const SizedBox.shrink();
              },
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                // Background image

                SizedBox(
                  height: screenHeight * 0.6,
                  // 60% of screen height
                  width: screenWidth,
                  child: const AssetImageView(
                    fileName: 'sky_club_background.png',
                    fit: BoxFit.cover,
                  ),
                ),

                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            'Fly Your\nWay',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimens.dimen_26,
                                ),
                          ),
                          Transform.translate(
                            offset: const Offset(-50, 0),
                            child: AssetImageView(fileName: 'paper_plane.svg'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                              .copyWith(bottom: 40), // Padding as 3% of width
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 3),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildWaySelector(),
                          // _buildFlightSelector(),
                          // const SizedBox(height: 20), // 2% of screen height
                          // _buildFlightDateSelector(),
                          // const SizedBox(height: 20),
                          ValueListenableBuilder(
                              valueListenable: widget.viewModel.selectedWay,
                              builder: (context, selectedWay, _) {
                                return selectedWay == TravelWay.multiCity
                                    ? Column(
                                        children: [
                                          MultiCityFlightSelector(
                                            viewModel: widget.viewModel,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              widget.viewModel
                                                  .addJourneySegment();
                                            },
                                            icon: Icon(Icons.add),
                                          ),
                                        ],
                                      )
                                    : _buildOneWayAndReturn();
                              }),

                          SeatClassDropDown(viewModel: widget.viewModel),
                          const SizedBox(height: 20),
                          _buildPassengerSelector(),
                        ],
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(0, -25, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          widget.viewModel.onClickSearch();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF110A7A),
                          foregroundColor: Colors.white,
                          minimumSize: Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: Dimens.dimen_15,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.search_outlined, size: 28),
                            SizedBox(width: 8),
                            Text(
                              "Search",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //CancelSubDialogue(onCancel: () {  }, onConfirm: () {  },)
                  ],
                ),

                // Positioned button
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWaySelector() {
    return Container(
      padding: EdgeInsets.all(20),
      child: valueListenableBuilder(
        listenable: widget.viewModel.selectedWay,
        builder: (context, selectedWay) {
          return FittedBox(
            fit: BoxFit.scaleDown, // Scales down if needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildWayButton(
                  context: context,
                  travelWay: TravelWay.oneWay,
                  isSelected: selectedWay == TravelWay.oneWay,
                  onTap: () =>
                      widget.viewModel.updateSelectedWay(TravelWay.oneWay),
                ),
                SizedBox(width: 10),
                _buildWayButton(
                  context: context,
                  travelWay: TravelWay.roundTrip,
                  isSelected: selectedWay == TravelWay.roundTrip,
                  onTap: () =>
                      widget.viewModel.updateSelectedWay(TravelWay.roundTrip),
                ),
                SizedBox(width: 10),
                _buildWayButton(
                  context: context,
                  travelWay: TravelWay.multiCity,
                  isSelected: selectedWay == TravelWay.multiCity,
                  onTap: () =>
                      widget.viewModel.updateSelectedWay(TravelWay.multiCity),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFlightSelector() {
    return FlightSelector(viewModel: widget.viewModel);
  }

  Widget _buildFlightDateSelector() {
    return FlightDateSelector(
      viewModel: widget.viewModel,
    );
  }

  Widget _buildWayButton({
    required BuildContext context,
    required TravelWay travelWay,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFF110A7A) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Text(
                travelWay.name,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight:
                          isSelected ? FontWeight.w500 : FontWeight.normal,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOneWayAndReturn() {
    return Column(
      children: [
        _buildFlightSelector(),
        const SizedBox(height: 20), // 2% of screen height
        _buildFlightDateSelector(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPassengerSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNumberSelector(
          label: 'ADULT',
          valueNotifier: widget.viewModel.numberOfAdults,
          onIncrement: widget.viewModel.incrementNumberOfAdults,
          onDecrement: widget.viewModel.decrementNumberOfAdults,
        ),
        _buildNumberSelector(
          label: 'CHILDREN',
          valueNotifier: widget.viewModel.numberOfChildren,
          onIncrement: widget.viewModel.incrementNumberOfChildren,
          onDecrement: widget.viewModel.decrementNumberOfChildren,
        ),
        _buildNumberSelector(
          label: 'INFANT',
          valueNotifier: widget.viewModel.numberOfInfants,
          onIncrement: widget.viewModel.incrementNumberOfInfants,
          onDecrement: widget.viewModel.decrementNumberOfInfants,
        ),
      ],
    );
  }

  Widget _buildNumberSelector({
    required String label,
    required ValueNotifier<int> valueNotifier,
    required String? Function() onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Container(
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ValueListenableBuilder<int>(
                valueListenable: valueNotifier,
                builder: (context, value, _) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      value.toString(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  );
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      final String? errorMessage = onIncrement();
                      if (errorMessage != null && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              errorMessage,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Transform.rotate(
                      angle: -pi / 2,
                      child: const Icon(
                        Icons.play_arrow,
                        size: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onDecrement,
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: const Icon(
                        Icons.play_arrow,
                        size: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
