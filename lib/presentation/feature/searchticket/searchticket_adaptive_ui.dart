import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_adaptive_ui.dart';
import 'package:club_alt/presentation/feature/searchticket/binding/searchticket_binding.dart';
import 'package:club_alt/presentation/feature/searchticket/route/searchticket_argument.dart';
import 'package:club_alt/presentation/feature/searchticket/searchticket_view_model.dart';
import 'package:club_alt/presentation/feature/searchticket/route/searchticket_route.dart';
import 'package:club_alt/presentation/feature/searchticket/screen/searchticket_mobile_portrait.dart';
import 'package:club_alt/presentation/feature/searchticket/screen/searchticket_mobile_landscape.dart';

class SearchticketAdaptiveUi extends BaseAdaptiveUi<SearchticketArgument, SearchticketRoute> {
  const SearchticketAdaptiveUi({super.argument, super.key});

  @override
  State<StatefulWidget> createState() => SearchticketAdaptiveUiState();
}

class SearchticketAdaptiveUiState extends BaseAdaptiveUiState<SearchticketArgument, SearchticketRoute, SearchticketAdaptiveUi, SearchticketViewModel, SearchticketBinding> {
  @override
  SearchticketBinding binding = SearchticketBinding();

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return SearchticketMobilePortrait(viewModel: viewModel, flightDetails: widget.argument!.flightDetails,);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return SearchticketMobileLandscape(viewModel: viewModel,flightDetails: widget.argument!.flightDetails,);
  }
}
