import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/bookform/binding/bookform_binding.dart';
import 'package:sky_club/presentation/feature/bookform/route/bookform_argument.dart';
import 'package:sky_club/presentation/feature/bookform/bookform_view_model.dart';
import 'package:sky_club/presentation/feature/bookform/route/bookform_route.dart';
import 'package:sky_club/presentation/feature/bookform/screen/bookform_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/bookform/screen/bookform_mobile_landscape.dart';

class BookformAdaptiveUi extends BaseAdaptiveUi<BookformArgument, BookformRoute> {
  const BookformAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => BookformAdaptiveUiState();
}

class BookformAdaptiveUiState extends BaseAdaptiveUiState<BookformArgument, BookformRoute, BookformAdaptiveUi, BookformViewModel, BookformBinding> {
  @override
  BookformBinding binding = BookformBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return BookformMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return BookformMobileLandscape(viewModel: viewModel);
  }
}
