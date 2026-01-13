import 'package:domain/model/skyClubModels/booking.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_ui_state.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/common_app_bar.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/drawer_list.dart';

import 'package:sky_club/presentation/feature/skybase/dashboard/dashboard_view_model.dart';
import 'package:sky_club/presentation/feature/skybase/dashboard/widgets/booking_card.dart';
import 'package:sky_club/presentation/feature/skybase/dashboard/widgets/record_tile.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';
import 'package:sky_club/presentation/values/dimens.dart';



class DashboardMobilePortrait extends StatefulWidget {
  final DashboardViewModel viewModel;

  const DashboardMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => DashboardMobilePortraitState();
}

class DashboardMobilePortraitState
    extends BaseUiState<DashboardMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CommonAppBar(),
      drawer: const Drawer(
        child: DrawerList(
          currentScreen: RoutePath.dashboard,
        ),
      ),
      body: RefreshIndicator(
          child: _buildBody(context),
          onRefresh: () async {
            await widget.viewModel.getMyBookings();
          }
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        children: [
          _records(context),
          _myBookings(context,),
        ],
      ),
    );
  }

  Widget _records(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.dimen_10, horizontal: Dimens.dimen_20),
      child: ValueListenableBuilder(
          valueListenable: widget.viewModel.myBookingsStats,
          builder: (context, stat, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RecordTile(
                  icon: Icons.calendar_month_rounded,
                  title: 'Total\nBooking',
                  value: stat?.totalBookings ?? 0,
                  color: Color(0xFF0FC5FF),
                ),
                RecordTile(
                  icon: Icons.pending_actions,
                  title: 'Pending\nBooking',
                  value: stat?.pendingBookings ?? 0,
                  color: Color(0xFFFF9F3E),
                ),
                RecordTile(
                  icon: Icons.not_interested,
                  title: 'Total\nCancelled',
                  value: stat?.cancelledBookings ?? 0,
                  color: Color(0xFFFF4040),
                ),
              ],
            );
          }
      ),



    );
  }

  Widget _myBookings(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_month_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'My Bookings',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.dimen_15,
                    ),
              ),
            ],
          ),
          ValueListenableBuilder(
              valueListenable: widget.viewModel.myBookings,
              builder: (context, myBookings, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: myBookings.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        widget.viewModel.ticketClicked(bookingId: myBookings[index].bookingId);
                      },
                      child: BookingCard(
                        booking: myBookings[index],
                      ),
                    );
                  },
                );
              }
          ),

        ],
      ),
    );
  }
}
