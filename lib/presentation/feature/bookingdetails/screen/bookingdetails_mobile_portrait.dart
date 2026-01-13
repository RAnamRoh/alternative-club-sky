import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_club/presentation/base/base_ui_state.dart';
import 'package:sky_club/presentation/feature/bookingdetails/bookingdetails_view_model.dart';
import 'package:sky_club/presentation/feature/bookingdetails/widget/baggage_and_fare_details.dart';
import 'package:sky_club/presentation/feature/bookingdetails/widget/fare_rules.dart';
import 'package:sky_club/presentation/feature/bookingdetails/widget/passenger_info.dart';
import 'package:sky_club/presentation/feature/bookingdetails/widget/travel_itinerary.dart';
import 'package:sky_club/presentation/values/dimens.dart';



class BookingdetailsMobilePortrait extends StatefulWidget {
  final BookingdetailsViewModel viewModel;
  final String bookintId;

  const BookingdetailsMobilePortrait(
      {required this.viewModel, required this.bookintId, super.key});

  @override
  State<StatefulWidget> createState() => BookingdetailsMobilePortraitState();
}

class BookingdetailsMobilePortraitState
    extends BaseUiState<BookingdetailsMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Booking ID #${widget.bookintId}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: Dimens.dimen_16.sp,
              ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          DefaultTabController(
            length: 4,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Dimens.dimen_20.r),
                  child: ButtonsTabBar(
                    contentPadding: EdgeInsets.symmetric(horizontal: Dimens.dimen_16.w, vertical: Dimens.dimen_12.h),
                    radius: Dimens.dimen_6.r,
                    height: Dimens.dimen_55.h,
                    backgroundColor: Colors.white,
                    unselectedBackgroundColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    labelStyle: TextStyle(
                      fontFamily: 'Graphik',
                      fontSize: Dimens.dimen_16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontFamily: 'Graphik',
                      fontSize: Dimens.dimen_16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF828282),
                    ),
                    tabs:  [
                      Tab(
                        icon: Icon(
                          Icons.airline_seat_recline_normal_sharp,
                          size: Dimens.dimen_20.r,
                        ),
                        text: 'Passenger Info',

                      ),
                      Tab(
                        icon: Icon(
                          Icons.luggage,
                          size: Dimens.dimen_20.r,
                        ),
                        text: 'Baggage and Fare Details',
                      ),
                      Tab(
                        icon: Icon(
                          Icons.lightbulb,
                          size: Dimens.dimen_20.r,
                        ),
                        text: 'Fare Rules',
                      ),
                      Tab(
                        icon: Icon(
                          Icons.event_note,
                          size: Dimens.dimen_20.r,
                        ),
                        text: 'Travel Itinerary',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: PassengerInfo(
                          viewModel: widget.viewModel,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: BaggageAndFareDetails(
                          viewModel: widget.viewModel,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: FareRules(
                          viewModel: widget.viewModel,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: TravelItinerary(
                          viewModel: widget.viewModel,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(Dimens.dimen_20.r).copyWith(
              bottom: Dimens.dimen_30.r,
            ),
            width: double.infinity,
            color: Colors.white,
            child: _buildButtons(context),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder(
            valueListenable: widget.viewModel.bookingStatus,
            builder: (context, status, child) {
              return status.toString().toLowerCase().contains('cancel')
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              widget.viewModel.onCancelClicked();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.dimen_5.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimens.dimen_20.w,
                                  vertical: Dimens.dimen_10.h), // Reduced padding
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              ),
                            ),
                            child: FittedBox(
                              // Ensures text scales down if necessary
                              child: Text(
                                'Cancel Book',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          Dimens.dimen_14.sp, // Adjusted font size
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: Dimens.dimen_10.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.dimen_5.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimens.dimen_10.w,
                                  vertical: Dimens.dimen_10.h), // Reduced padding
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              'Download Ticket',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        Dimens.dimen_14.sp, // Adjusted font size
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    );
            }),
        SizedBox(height: Dimens.dimen_5.h),
        ValueListenableBuilder(
            valueListenable: widget.viewModel.bookingStatus,
            builder: (context, status, child) {
              return status.toString().toLowerCase().contains('paid') ||
                      status.toString().toLowerCase().contains('cancel')
                  ? const SizedBox.shrink()
                  : ElevatedButton(
                      onPressed: () async {
                        widget.viewModel.makePayment();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, Dimens.dimen_40.h),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimens.dimen_5.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimens.dimen_20.w,
                            vertical: Dimens.dimen_10.h),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Pay Now',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: Dimens.dimen_14.sp,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    );
            })
      ],
    );
  }
}
