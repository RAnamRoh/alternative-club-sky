import 'package:domain/model/skyClubModels/sky_user.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/base/base_ui_state.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/common_app_bar.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/drawer_list.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/feature/skybase/account/account_view_model.dart';
import 'package:club_alt/presentation/feature/skybase/account/widget/logout_dialog.dart';
import 'package:club_alt/presentation/navigation/route_path.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class AccountMobilePortrait extends StatefulWidget {
  final AccountViewModel viewModel;

  const AccountMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => AccountMobilePortraitState();
}

class AccountMobilePortraitState extends BaseUiState<AccountMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      drawer: Drawer(
        child: DrawerList(
          currentScreen: RoutePath.account,
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: widget.viewModel.user,
          builder: (context, user, child) => _userInfo(context, user),
        ),
        _buildSettings(context),
      ],
    );
  }

  Widget _userInfo(BuildContext context, SkyUser? user) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_20, vertical: Dimens.dimen_16),
      color: Color(0xFFF0EFF9),
      child: Row(
        children: [
          Container(
            height: Dimens.dimen_80,
            width: Dimens.dimen_80,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF00A1CA),
            ),
            child: Image.network(
              height: Dimens.dimen_134,
              width: double.infinity,
              user?.picture ?? '',
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey.shade400,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: Dimens.dimen_16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user?.name ?? '',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.dimen_18,
                    ),
              ),
              Text(user?.email ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimens.dimen_14,
                        color: Color(0xFF727272),
                      ))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSettings(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _accountAndSecurity(context),
          _about(context),
          _logOutButton(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: Dimens.dimen_14,
                color: Color(0xFF5F5F5F),
              ),
        ),
        SizedBox(
          width: Dimens.dimen_16,
        ),
        Expanded(
          child: Divider(
            height: 1,
            color: Color(0xFFD9D9D9),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    VoidCallback onTap,
    String imageName, {
    bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      // splashColor: Theme.of(context).primaryColor.withOpacity(0.2), // Customize splash color
      // highlightColor: Theme.of(context).primaryColor.withOpacity(0.1), // Customize highlight color
      child: Row(
        children: [
          AssetImageView(
            fileName: imageName,
            height: Dimens.dimen_24,
            width: Dimens.dimen_24,
          ),
          SizedBox(width: Dimens.dimen_20),
          Text(
            title,
            style: isLast
                ? Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.dimen_16,
                      color: isLast ? Color(0xFFF75555) : Colors.black,
                    )
                : Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.dimen_16,
                      color: isLast ? Color(0xFFF75555) : Colors.black,
                    ),
          ),
          const Spacer(),
          if (!isLast) Icon(Icons.chevron_right, size: Dimens.dimen_24),
        ],
      ),
    );
  }

  Widget _accountAndSecurity(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.dimen_10),
      child: Column(
        children: [
          _buildSectionHeader(context, 'Account & Security'),
          SizedBox(
            height: Dimens.dimen_24,
          ),
          _buildMenuItem(context, 'Edit Profile', () {
            widget.viewModel.onClickEditProfile();
          }, 'edit.svg'),
          SizedBox(
            height: Dimens.dimen_24,
          ),
          _buildMenuItem(
            context,
            'Change Password',
            () {
              widget.viewModel.onClickChangePassword();
            },
            'lock.svg',
          ),
        ],
      ),
    );
  }

  Widget _about(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.dimen_10),
      child: Column(
        children: [
          _buildSectionHeader(context, 'About'),
          SizedBox(
            height: Dimens.dimen_24,
          ),
          _buildMenuItem(
            context,
            'Help Center',
            () {},
            'help-circle.svg',
          ),
          SizedBox(
            height: Dimens.dimen_24,
          ),
          _buildMenuItem(context, 'About SkyClub', () {}, 'info.svg'),
        ],
      ),
    );
  }

  Widget _logOutButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.dimen_10),
      child: _buildMenuItem(context, 'Log Out', () async {
        openDialog();
      }, 'log-out.svg', isLast: true),
    );
  }

  void openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutDialog(
          onDone: () async {
            widget.viewModel.onClickLogout();
          },
        );
      },
    );
  }
}
