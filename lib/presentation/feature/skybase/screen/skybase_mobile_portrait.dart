import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_ui_state.dart';
import 'package:sky_club/presentation/feature/skybase/skybase_view_model.dart';



class SkybaseMobilePortrait extends StatefulWidget {
  final SkybaseViewModel viewModel;

  const SkybaseMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => SkybaseMobilePortraitState();
}

class SkybaseMobilePortraitState extends BaseUiState<SkybaseMobilePortrait> {
 // final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, result) async {
        if (didPop) {
          // The pop operation was successful (e.g., the app is exiting).
          return;
        }

        // Call the view model function to handle the back button press.
        final shouldPop = widget.viewModel.backOnBasePressed();

        // If the view model allows the pop operation, return true.
        // Otherwise, return false to prevent the app from exiting.
        return shouldPop;
      },

      child: Scaffold(
        body: _homeBody(context),
        bottomNavigationBar: _bottomNavigation(context),
      ),
    );
  }

  Widget _homeBody(BuildContext context) {
    return PageView(
      controller: widget.viewModel.pageController,
      onPageChanged: (index) => widget.viewModel.onPageChanged(index),
      physics: const NeverScrollableScrollPhysics(),
      children: widget.viewModel.navigationItems.map((e) => e.page).toList(),
    );
  }

  Widget _bottomNavigation(BuildContext context) {
    return valueListenableBuilder(
        listenable: widget.viewModel.currentPageIndex,
        builder: (context, value) {
          return NavigationBar(
            elevation: 30.0,
            shadowColor: Colors.black,
            selectedIndex: value,
            indicatorColor: Colors.transparent,
            onDestinationSelected: (index) {
             // _pageController.jumpToPage(index);
              widget.viewModel.onNavigationItemClicked(index);
            },
            destinations: widget.viewModel.navigationItems
                .map(
                  (e) => NavigationDestination(
                    icon: Icon(e.icon, color: Color(0xFF0F182E)),
                    selectedIcon: Icon(e.selectedIcon, color: Theme.of(context).colorScheme.primary,),
                    label: e.getNames(),
                  ),
                )
                .toList(),
          );
        });
  }
}
