import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class AppTextTheme extends TextTheme {
  final TextStyle _commonTextStyle = GoogleFonts.roboto();

  final TextStyle _neuropaTextStyle = const TextStyle(
    fontFamily: 'Neuropa',
  );

  final TextStyle _graphikTextStyle = const TextStyle(
    fontFamily: 'Graphik',
  );

  @override
  TextStyle? get displayLarge => _neuropaTextStyle.copyWith(
        fontSize: Dimens.dimen_57,
      );

  @override
  TextStyle? get displayMedium => _neuropaTextStyle.copyWith(
        fontSize: Dimens.dimen_45,
      );

  @override
  TextStyle? get displaySmall => _neuropaTextStyle.copyWith(
        fontSize: Dimens.dimen_44,
      );

  @override
  TextStyle? get headlineLarge => _neuropaTextStyle.copyWith(
        fontSize: Dimens.dimen_32,
      );

  @override
  TextStyle? get headlineMedium => _neuropaTextStyle.copyWith(
        fontSize: Dimens.dimen_28,
      );

  @override
  TextStyle? get headlineSmall => _neuropaTextStyle.copyWith(
        fontSize: Dimens.dimen_24,
        fontWeight: FontWeight.w500,
      );



  @override
  TextStyle? get labelLarge => _neuropaTextStyle.copyWith(
        fontSize: Dimens.dimen_16,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle? get labelMedium => _neuropaTextStyle.copyWith(
        fontSize: Dimens.dimen_12,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle? get labelSmall => _neuropaTextStyle.copyWith(
        fontSize: Dimens.dimen_12,
    fontWeight: FontWeight.w500,
      );

  @override
  TextStyle? get titleLarge => _graphikTextStyle.copyWith(
    fontSize: Dimens.dimen_22,
    fontWeight: FontWeight.w600,
  );

  @override
  TextStyle? get titleMedium => _graphikTextStyle.copyWith(
    fontSize: Dimens.dimen_16,
    fontWeight: FontWeight.w600,
  );

  @override
  TextStyle? get titleSmall => _graphikTextStyle.copyWith(
    fontSize: Dimens.dimen_14,
    fontWeight: FontWeight.w400,
  );




  @override
  TextStyle? get bodyLarge => _neuropaTextStyle.copyWith(
        fontSize: Dimens.dimen_16,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle? get bodyMedium => _neuropaTextStyle.copyWith(
        fontSize: Dimens.dimen_14,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle? get bodySmall => _neuropaTextStyle.copyWith(
        fontSize: Dimens.dimen_12,
      );
}
