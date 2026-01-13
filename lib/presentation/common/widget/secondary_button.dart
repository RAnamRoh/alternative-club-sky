import 'package:flutter/material.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final double? minWidth;
  final IconData? leadingIcon;

  const SecondaryButton({
    super.key,
    this.leadingIcon,
    required this.label,
    required this.onPressed,
    this.padding,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: minWidth,
      color: Color(0xFFB9B9B9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            Dimens.dimen_5,
          ),
        ),
      ),
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: Dimens.dimen_40,
            vertical: Dimens.dimen_10,
          ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null)
            Icon(
              leadingIcon,
              size: Dimens.dimen_18,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          if (leadingIcon != null) SizedBox(width: Dimens.dimen_8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: Dimens.dimen_16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
