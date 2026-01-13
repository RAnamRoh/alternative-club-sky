import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_ui_state.dart';
import 'package:sky_club/presentation/common/widget/asset_image_view.dart';
import 'package:sky_club/presentation/feature/splash/splash_view_model.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class SplashMobilePortrait extends StatefulWidget {
  final SplashViewModel viewModel;

  const SplashMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => SplashMobilePortraitState();
}

class SplashMobilePortraitState extends BaseUiState<SplashMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(Dimens.dimen_20),
          child: const AssetImageView(fileName: 'sky_club_logo.svg', height: 100, width: 100,),
        ),
      )
    );
  }
}
