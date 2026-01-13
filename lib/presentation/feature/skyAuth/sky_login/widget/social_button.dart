import 'package:flutter/material.dart';
import 'package:sky_club/presentation/common/widget/asset_image_view.dart';

import '../../../../values/dimens.dart';

class SocialButton extends StatelessWidget {

  final String name;
  final String imageName;
  final VoidCallback onTap;

  const SocialButton({super.key, required this.name, required this.imageName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_16, vertical: Dimens.dimen_12),
          decoration: BoxDecoration(
            color: Color(0xFFF0F1F3),
            borderRadius: BorderRadius.circular(Dimens.dimen_5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AssetImageView(fileName: imageName, height: 20, width: 20,),
              SizedBox(width: Dimens.dimen_8),
              Text(name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,

              ),
              ),
            ],
          ),
        )
    );
  }
}
