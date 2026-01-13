import 'package:flutter/material.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class SkyPasswordTextField extends StatelessWidget {
  final TextEditingController passwordTextEditingController;
  final String? errorText;

  const SkyPasswordTextField(
      {super.key, required this.passwordTextEditingController, this.errorText});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> passwordVisibilityState = ValueNotifier(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
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
                  errorText: errorText,
                  errorStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimens.dimen_12,
                    color: Colors.red.shade900,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(5, 10, 0, 10),
                  hintText: '****',
                  hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimens.dimen_12,
                        color: Colors.grey,
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
