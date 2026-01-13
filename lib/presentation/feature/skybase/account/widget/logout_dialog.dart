import 'package:flutter/material.dart';
import 'package:sky_club/presentation/common/widget/asset_image_view.dart';
import 'package:sky_club/presentation/common/widget/primary_button.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onDone;
  const LogoutDialog({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return _buildAlert(context);
  }

  Widget _buildAlert(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          _buildContent(context),
          Positioned(
            top: -40,
            child: _buildLogo(context),
          )
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: 327,
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
          'Logout Confirmation',
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
            'Are you sure you want to log out?',
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: Dimens.dimen_40,
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFB9B9B9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.dimen_5),
              ),
            ),
            child: Text('Cancel',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: Dimens.dimen_16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onPrimary
              ),
            ),
          ),
        ),
      SizedBox(
        height: Dimens.dimen_40,
        child: ElevatedButton(
        onPressed: onDone,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dimen_5),
          ),
        ),
        child: Text('Logout',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: Dimens.dimen_16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onPrimary
          ),
        ),
            ),
      )
      ],
    );
  }
}
