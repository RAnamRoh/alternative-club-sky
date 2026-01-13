import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_ui_state.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/feature/splash/splash_view_model.dart';
import 'package:club_alt/presentation/values/dimens.dart';

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
          child: const AssetImageView(fileName: 'club_alt_logo.svg', height: 100, width: 100,),
        ),
      )
    );
  }
}
