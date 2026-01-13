import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_ui_state.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/common_app_bar.dart';
import 'package:sky_club/presentation/feature/bookform/bookform_view_model.dart';

import '../../../common/skyClubWidgets/drawer_list.dart';
import '../../../navigation/route_path.dart';
import '../widget/confirmation_screen.dart';
import '../widget/extras_form.dart';
import '../widget/passenger_form.dart';
import '../widget/payment_form.dart';

class BookformMobilePortrait extends StatefulWidget {
  final BookformViewModel viewModel;

  const BookformMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => BookformMobilePortraitState();
}

class BookformMobilePortraitState extends BaseUiState<BookformMobilePortrait> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Initialize the PageController
    _pageController = PageController(initialPage: widget.viewModel.currentStep.value);

    // Listen to currentStep changes and animate the PageView
    widget.viewModel.currentStep.addListener(() {
      _pageController.animateToPage(
        widget.viewModel.currentStep.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        showBackButton: true,
      ),
      drawer: Drawer(
        child: DrawerList(currentScreen: RoutePath.bookform,),
      ),
      body: Column(
        children: [
          // Header Section
          ValueListenableBuilder<int>(
            valueListenable: widget.viewModel.currentStep,
            builder: (context, currentStep, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    final isActive = index == currentStep;
                    final steps = ["Passenger", "Extras", "Payment", "Confirm"];
                    return Column(
                      children: [
                        Text(
                          steps[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: isActive ? FontWeight.w400 : FontWeight.w300,
                            color: isActive ? Colors.blue : Colors.grey,
                          ),
                        ),
                        if (isActive)
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            height: 2,
                            width: 20,
                            color: Colors.blue,
                          ),
                      ],
                    );
                  }),
                ),
              );
            },
          ),
          // Forms Section
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(), // Prevent swiping
              children: [
                PassengerForm(viewModel: widget.viewModel),
                ExtrasForm(viewModel: widget.viewModel),
                PaymentForm(viewModel: widget.viewModel),
                ConfirmationScreen(viewModel: widget.viewModel),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

