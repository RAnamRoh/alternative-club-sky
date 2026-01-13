import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:club_alt/presentation/base/base_ui_state.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/form_text_field.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/feature/otp_verification/otp_verification_view_model.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class OtpVerificationMobilePortrait extends StatefulWidget {
  final OtpVerificationViewModel viewModel;
  final VoidCallback? onPop;

  const OtpVerificationMobilePortrait({
    required this.viewModel,
    this.onPop,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => OtpVerificationMobilePortraitState();
}

class OtpVerificationMobilePortraitState
    extends BaseUiState<OtpVerificationMobilePortrait> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.initialize();
    widget.viewModel.errorStream.listen((message) {
      if (mounted) {
        // Ensure the widget is still in the tree
        _showErrorDialog(message);
      }
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return AlertDialog(
        //   title: const Text('Verification Failed'),
        //   // Clean up the message for display
        //   content: Text(message.replaceAll("BaseException:", "").trim()),
        //   actions: [
        //     TextButton(
        //       child: const Text('OK'),
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //     ),
        //   ],
        // );
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: EdgeInsets.all(Dimens.dimen_20.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "OTP Verification Failed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Dimens.dimen_16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Dimens.dimen_16.h),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(),
                ),
                SizedBox(height: Dimens.dimen_16.h),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.dimen_8.r),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: Dimens.dimen_16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, dynamic result){
        if (didPop){
          widget.onPop?.call();
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimens.dimen_16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssetImageView(
              fileName: 'otp-check.png',
              height: Dimens.dimen_200.h,
              width: Dimens.dimen_200.w,
            ),
            Text(
              'Enter Verification Code',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Text(
              'Please enter the verification code sent to your mobile number',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            FormTextField(
              controller: widget.viewModel.otpController,
              label: '',
              hintText: '',
              textInputType: TextInputType.number,
              validator: widget.viewModel.validateOtp,
            ),
            SizedBox(
              height: Dimens.dimen_16.h,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: widget.viewModel.otpIsValid,
              builder: (context, isValid, _) {
                return Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          isValid ? widget.viewModel.verifyOtp() : null;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isValid
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                          foregroundColor: Colors.white,
                          minimumSize: Size(Dimens.dimen_100, Dimens.dimen_40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: Dimens.dimen_15,
                          ),
                        ),
                        child: Text(
                          "Verify",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
