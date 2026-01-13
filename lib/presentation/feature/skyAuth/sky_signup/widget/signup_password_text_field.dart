import 'package:flutter/material.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class SignUpPasswordTextField extends StatelessWidget {
  final TextEditingController passwordTextEditingController;
  final String label;
  final bool showError;
  const SignUpPasswordTextField(
      {super.key, required this.passwordTextEditingController, required this.label, this.showError = false});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> passwordVisibilityState = ValueNotifier(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: Dimens.dimen_14,
          ),
        ),
        ValueListenableBuilder(
            valueListenable: passwordVisibilityState,
            builder: (context, isPasswordVisible, child) {
              return TextField(
                controller: passwordTextEditingController,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.dimen_12,
                ),
                decoration: InputDecoration(
                  errorText: showError ? 'Password does not match' : null,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(5, 10, 0, 10),
                  hintText: '*****',
                  hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimens.dimen_12,
                    color: Colors.grey,
                  ),
                  errorStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimens.dimen_12,
                    color: Colors.red.shade900,
                  ),
                  suffixIcon: IconButton(
                    icon: isPasswordVisible
                        ? const Icon(Icons.visibility_off,size: 15,)
                        : const Icon(Icons.visibility, size: 15,),
                    onPressed: () => passwordVisibilityState.value =
                    !passwordVisibilityState.value,
                  ),
                ),
                obscureText: !isPasswordVisible,
              );
            }),
      ],
    );
  }
}
