import 'package:flutter/material.dart';
import 'package:sky_club/presentation/feature/edit_profile/screen/edit_profile_mobile_portrait.dart';

class EditProfileMobileLandscape extends EditProfileMobilePortrait {

  const EditProfileMobileLandscape({required super.viewModel, super.key, required super.user});

  @override
  State<StatefulWidget> createState() => EditProfileMobileLandscapeState();
}

class EditProfileMobileLandscapeState extends EditProfileMobilePortraitState {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Placeholder(),
    );
  }
}
