import 'package:domain/model/skyClubModels/faq.dart';
import 'package:domain/model/skyClubModels/travelLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:club_alt/presentation/base/base_ui_state.dart';
import 'package:club_alt/presentation/base/screen_util/screen_util_builder.dart';
import 'package:club_alt/presentation/common/extension/string_ext.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/common_app_bar.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/drawer_list.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/image_tile_card.dart';
import 'package:club_alt/presentation/feature/explore/explore_view_model.dart';
import 'package:club_alt/presentation/feature/explore/widget/discover_location.dart';
import 'package:club_alt/presentation/feature/explore/widget/dynamic_location_tile.dart';
import 'package:club_alt/presentation/feature/explore/widget/faq_section.dart';
import 'package:club_alt/presentation/feature/explore/widget/location_tiles.dart';
import 'package:club_alt/presentation/feature/explore/widget/trending_destination.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/values/dimens.dart';



class ExploreMobilePortrait extends StatefulWidget {
  final ExploreViewModel viewModel;

  const ExploreMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => ExploreMobilePortraitState();
}

class ExploreMobilePortraitState extends BaseUiState<ExploreMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      backgroundColor: Color(0xFFF7F7F7),
      drawer: Drawer(
        child: DrawerList(
          currentScreen: RoutePath.explore,
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _discoverHorizon(context),
          _trendingDestination(context),
          ValueListenableBuilder(
              valueListenable: widget.viewModel.travelLocationList,
              builder: (context, value, _){
                return LocationTiles(travelLocations: value);
              }
          ),
          FaqSection(faqs: Faq.dummyFaqs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                print("Call Us Pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                minimumSize: Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.dimen_5),
                ),
              ),
              child: Text(
                "Call Us",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: Dimens.dimen_20,
          )
        ],
      ),
    );
  }

  Widget _discoverHorizon(BuildContext context) {
    return Container(
      width: double.infinity.w,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF00A1CA),
            Color(0xFF3E68A7),
          ],
        ),
      ),
      child: Column(
        children: [
          _discoverText(context),
          DiscoverLocation(viewModel: widget.viewModel,),
        ],
      ),
    );
  }

  Widget _discoverText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Column(
            children: [
              Text(
                'Discover New',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Dimens.dimen_35.sp,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                'Horizons!',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: Dimens.dimen_35.sp,
                      fontWeight: FontWeight.w500,
                    ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                'Book Your Next Adventure Today!',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              Text(
                'Affordable Flight to Your Dream Destinations.',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _trendingDestination(BuildContext context) {
    return TrendingDestination();
  }
}
