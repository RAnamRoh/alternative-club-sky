import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_adaptive_ui.dart';
import 'package:sky_club/presentation/feature/bookingdetails/binding/bookingdetails_binding.dart';
import 'package:sky_club/presentation/feature/bookingdetails/route/bookingdetails_argument.dart';
import 'package:sky_club/presentation/feature/bookingdetails/bookingdetails_view_model.dart';
import 'package:sky_club/presentation/feature/bookingdetails/route/bookingdetails_route.dart';
import 'package:sky_club/presentation/feature/bookingdetails/screen/bookingdetails_mobile_portrait.dart';
import 'package:sky_club/presentation/feature/bookingdetails/screen/bookingdetails_mobile_landscape.dart';

class BookingdetailsAdaptiveUi extends BaseAdaptiveUi<BookingdetailsArgument, BookingdetailsRoute> {

  const BookingdetailsAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => BookingdetailsAdaptiveUiState();
}

class BookingdetailsAdaptiveUiState extends BaseAdaptiveUiState<BookingdetailsArgument, BookingdetailsRoute, BookingdetailsAdaptiveUi, BookingdetailsViewModel, BookingdetailsBinding> {
  @override
  BookingdetailsBinding binding = BookingdetailsBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return BookingdetailsMobilePortrait(viewModel: viewModel, bookintId: widget.argument!.bookingId,);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return BookingdetailsMobileLandscape(viewModel: viewModel, bookintId: widget.argument!.bookingId,);
  }
}
