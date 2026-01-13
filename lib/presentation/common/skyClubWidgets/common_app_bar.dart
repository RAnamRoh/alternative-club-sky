import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onMenuPressed;
  final bool showBackButton;
  final bool gotNotification = false;

  const CommonAppBar({
    Key? key,
    this.onNotificationPressed,
    this.onMenuPressed,
    this.showBackButton = false, // Default is no back button
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      centerTitle: showBackButton ? true : false,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Pops the current screen
              },
            )
          : null,
      title: AssetImageView(
        fileName: 'club_alt_logo2.svg',
        height: Dimens.dimen_25,
        width: Dimens.dimen_100,
      ),
      actions: [
        gotNotification
            ? IconButton(
                icon: Badge.count(
                  textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontSize: Dimens.dimen_8,
                        fontWeight: FontWeight.w500,
                      ),
                  backgroundColor: Color(0xFFFF9F3E),
                  offset: const Offset(7, -7),
                  count: 0,
                  child: AssetImageView(
                    fileName: 'notification2.svg',
                    height: Dimens.dimen_24,
                    width: Dimens.dimen_24,
                  ),
                ),
                onPressed: onNotificationPressed ?? () {},
              )
            : IconButton(
                icon: AssetImageView(
                  fileName: 'notification2.svg',
                  height: Dimens.dimen_24,
                  width: Dimens.dimen_24,
                ),
                onPressed: onNotificationPressed ?? () {},
              ),
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: AssetImageView(
                fileName: 'menu.svg',
                height: Dimens.dimen_24,
                width: Dimens.dimen_24,
                color: Colors.white,
              ),
              onPressed:
                  onMenuPressed ?? () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
