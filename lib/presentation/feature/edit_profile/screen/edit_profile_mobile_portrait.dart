import 'package:domain/enum/country.dart';
import 'package:domain/model/skyClubModels/sky_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:club_alt/presentation/base/base_ui_state.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/form_drop_down.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/form_text_field.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/mobile_form_text_field.dart';
import 'package:club_alt/presentation/common/widget/common_widgets.dart';
import 'package:club_alt/presentation/common/widget/primary_button.dart';
import 'package:club_alt/presentation/feature/edit_profile/edit_profile_view_model.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class EditProfileMobilePortrait extends StatefulWidget {
  final SkyUser user;
  final EditProfileViewModel viewModel;

  const EditProfileMobilePortrait({required this.viewModel, required this.user, super.key});

  @override
  State<StatefulWidget> createState() => EditProfileMobilePortraitState();
}

class EditProfileMobilePortraitState
    extends BaseUiState<EditProfileMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Personal Information',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: Dimens.dimen_16,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
      body: overflowScrollView(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _userInfo(context),
        _buildForm(context),
      ],
    );
  }

  Widget _userInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.dimen_20, vertical: Dimens.dimen_16),
      color: Color(0xFFF0EFF9),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: Dimens.dimen_80,
                width: Dimens.dimen_80,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Image.network(
                  height: Dimens.dimen_134,
                  width: double.infinity,
                  widget.user.picture ?? '',
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
              InkWell(
                onTap: () {
                  print('tapped');
                  widget.viewModel.selectPicture();
                },
                child: Container(
                    width: Dimens.dimen_24,
                    height: Dimens.dimen_24,
                    padding: EdgeInsets.all(Dimens.dimen_2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.onPrimary,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ]),
                    child: SvgPicture.asset(
                      'assets/images/pencil.svg',
                      width: 12, // Set the desired width
                      height: 12, // Set the desired height
                      fit: BoxFit
                          .scaleDown, // Ensure the image fits within the given size
                    )),
              ),
            ],
          ),
          SizedBox(
            height: Dimens.dimen_16,
          ),
          valueListenableBuilder(listenable: widget.viewModel.image, builder: (context, value,) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               value == null ? const SizedBox.shrink() : Text('Image Selected' ?? ''),
                SizedBox(width: Dimens.dimen_8,),
                value == null ? const SizedBox.shrink() : IconButton(onPressed: (){
                  widget.viewModel.removeImage();
                }, icon: const Icon(Icons.delete, color: Colors.red,),)
              ],
            );
          }),
          Text(
            widget.user.name ?? '',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: Dimens.dimen_18,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
              horizontal: Dimens.dimen_16, vertical: Dimens.dimen_16)
          .copyWith(
        bottom: Dimens.dimen_40,
      ),
      child: Column(
        children: [
          _nameAndNumber(context),
          SizedBox(height: Dimens.dimen_16),
          _address(context),
          SizedBox(height: Dimens.dimen_16),
          _buildSaveButton(context),
        ],
      ),
    );
  }

  Widget _nameAndNumber(BuildContext context) {
    return Column(
      children: [
        FormTextField(
          controller: widget.viewModel.firstNameController,
          label: 'First Name',
          hintText: widget.user.givenName ?? '',
          textInputType: TextInputType.text,
        ),
        SizedBox(height: Dimens.dimen_16),
        FormTextField(
          controller: widget.viewModel.lastNameController,
          label: 'Last Name',
          hintText: widget.user.familyName ?? '',
          textInputType: TextInputType.text,
        ),
        SizedBox(height: Dimens.dimen_16),
        ValueListenableBuilder(
            valueListenable: widget.viewModel.emailController,
            builder: (context, value, _) {
              return FormTextField(
                controller: widget.viewModel.emailController,
                label: 'Email',
                hintText: widget.user.email,
                textInputType: TextInputType.text,
                errorText: widget.viewModel.getEmailError(context),
              );
            }
        ),

        SizedBox(height: Dimens.dimen_16),

        ValueListenableBuilder(valueListenable: widget.viewModel.initialCountryCode,
            builder: (context, currentCountryCode, _){
          return MobileFormTextField(
            controller: widget.viewModel.phoneController,
            phoneNumberNotifier: widget.viewModel.phoneNumberNotifier,
            countryCode: currentCountryCode,
            phoneNumber: widget.viewModel.initialPhoneNumber.value,
            showError: false,
          );
        }),
      ],
    );
  }

  Widget _address(BuildContext context) {
    return Column(
      children: [
        FormTextField(
          controller: widget.viewModel.streetController,
          label: 'Street Address',
          hintText: widget.user.address.street ?? '',
          textInputType: TextInputType.text,
        ),
        SizedBox(height: Dimens.dimen_16),
        FormTextField(
          controller: widget.viewModel.houseNumberController,
          label: 'House No.',
          hintText: widget.user.address.suiteNo ?? '',
          textInputType: TextInputType.text,
        ),
        SizedBox(height: Dimens.dimen_16),
        FormTextField(
          controller: widget.viewModel.stateController,
          label: 'State',
          hintText: widget.user.address.state ?? '',
          textInputType: TextInputType.text,
        ),
        SizedBox(height: Dimens.dimen_16),
        // FormTextField(
        //   controller: widget.viewModel.countryController,
        //   label: 'Country',
        //   hintText: widget.user.address.country ?? '',
        //   textInputType: TextInputType.text,
        // ),
        ValueListenableBuilder(
          valueListenable: widget.viewModel.passportCountry,
          builder: (context, value, child) {
            return FormDropDown<Countries>(
              label: 'Country',
              items: Countries.values,
              itemToString: (country) => country.name,
              selectedItem: value,
              onItemSelected: (selected) {
                if (selected != null) {
                  widget.viewModel.countryController.text = selected.name;
                  widget.viewModel.passportCountry.value = selected;
                }
              },
            );
          },
        ),
        SizedBox(height: Dimens.dimen_16),
        FormTextField(
          controller: widget.viewModel.cityController,
          label: 'City',
          hintText: widget.user.address.city ?? '',
          textInputType: TextInputType.text,
        ),
        SizedBox(height: Dimens.dimen_16),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return PrimaryButton(
      label: 'Save',
      onPressed: () async {
        await widget.viewModel.onClickSave();
      },
      minWidth: double.infinity,
    );
  }
}
