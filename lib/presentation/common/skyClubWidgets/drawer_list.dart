import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:club_alt/presentation/base/base_viewmodel.dart';
import 'package:club_alt/presentation/feature/explore/route/explore_argument.dart';
import 'package:club_alt/presentation/feature/explore/route/explore_route.dart';
import 'package:club_alt/presentation/feature/searchticket/route/searchticket_argument.dart';
import 'package:club_alt/presentation/feature/searchticket/route/searchticket_route.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_route.dart';
import 'package:club_alt/presentation/feature/skyhome/route/skyhome_argument.dart';
import 'package:club_alt/presentation/feature/skyhome/route/skyhome_route.dart';
import 'package:club_alt/presentation/feature/skyhome/skyhome_view_model.dart';
import 'package:club_alt/presentation/navigation/app_router.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';

class DrawerList extends StatelessWidget {

  final RoutePath currentScreen;

  const DrawerList({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            _header(context),
            const SizedBox(height: 10),
            _screenList(context),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/club_alt_logo.svg',
            width: 100,
            height: 25,
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.cancel_outlined),
            onPressed: () => Navigator.of(context).pop(), // Close the drawer
          ),
        ],
      ),
    );
  }

  Widget _screenList(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          drawerItem(label: 'Explore',onTap: () {
            AppRouter.pushReplacement(context, ExploreRoute(arguments: ExploreArgument()));
          }, screenIdentifier: RoutePath.explore, context: context, currentScreen: currentScreen),
          drawerItem(label: 'Book', onTap: () {
            AppRouter.navigateToAndClearStack(context, SkybaseRoute(arguments: SkybaseArgument()));
          }, screenIdentifier: RoutePath.skyhome, context: context, currentScreen: currentScreen),
          drawerItem(label: 'Experience', screenIdentifier: RoutePath.home, context: context),
          drawerItem(label: 'Privilege Club', screenIdentifier: RoutePath.home, context: context),
          drawerItem(label: 'Buy Tickets', screenIdentifier: RoutePath.home, context: context),
          drawerItem(label: 'FAQs', screenIdentifier: RoutePath.home, context: context),
          drawerItem(label: 'Best Deals', screenIdentifier: RoutePath.home, context: context),
          drawerItem(label: 'Subscription', screenIdentifier: RoutePath.home, context: context),
          drawerItem(label: 'Offers', screenIdentifier: RoutePath.home, context: context),
          drawerItem(label: 'About', screenIdentifier: RoutePath.home, context: context),
          drawerItem(label: 'Contact', screenIdentifier: RoutePath.home, context: context),
        ],
      ),
    );
  }

  Widget drawerItem({required String label, void Function()? onTap, required RoutePath screenIdentifier, RoutePath? currentScreen,  required BuildContext context}) {

    bool isActive = screenIdentifier == currentScreen;
    Color backgroundColor = isActive ? Theme.of(context).primaryColor : Colors.transparent;
    Color labelColor = isActive ? Colors.white : Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric( vertical: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(label,
              style:  Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: labelColor
              )
              ),
              const Spacer(),
               Icon(Icons.arrow_forward, color: isActive ? Colors.white : Colors.grey.shade400,),
            ],
          ),
        ),
      ),
    );
  }
}
