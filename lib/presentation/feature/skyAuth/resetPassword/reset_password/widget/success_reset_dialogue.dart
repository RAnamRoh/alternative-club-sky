import 'package:flutter/material.dart';
import 'package:sky_club/presentation/common/widget/asset_image_view.dart';
import 'package:sky_club/presentation/common/widget/primary_button.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class SuccessResetDialogue extends StatelessWidget {
  final VoidCallback onDone;
  const SuccessResetDialogue({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return _buildAlert(context);
  }

  Widget _buildAlert(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        _buildContent(context),
        Positioned(
          top: -40,
          child: _buildLogo(context),
        )
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: 350,
      padding: EdgeInsets.symmetric(
              horizontal: Dimens.dimen_10, vertical: Dimens.dimen_35)
          .copyWith(
        top: Dimens.dimen_79,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.dimen_16),
        border: Border.all(
          color: Color(0xFF00A1CA),
          width: Dimens.dimen_3,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImage(context),
          SizedBox(height: Dimens.dimen_28),
          _buildText(context),
          SizedBox(height: Dimens.dimen_25),
          _buildButton(context),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_15),
      width: Dimens.dimen_80,
      height: Dimens.dimen_80,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: Color(0xFF00A1CA),
            width: Dimens.dimen_3,
          )),
      child: AssetImageView(
        fileName: 'sky_club_symbol.svg',
        height: 20,
        width: 20,
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Column(
      children: [
        Text(
          'Successful password Reset!',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: Dimens.dimen_18,
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(height: Dimens.dimen_26),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20),
          child: Text(
            textAlign: TextAlign.center,
            'You can now use your new password to login to your account!',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: Dimens.dimen_16,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return AssetImageView(fileName: 'reset_success.svg');
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
        onPressed: onDone,
        child: Text('Done',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: Dimens.dimen_16,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onPrimary
        ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          minimumSize: Size(175, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dimen_5),
          ),
        ),
    );
  }
}
