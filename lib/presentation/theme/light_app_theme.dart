import 'dart:ui';

import 'package:club_alt/presentation/theme/app_theme.dart';
import 'package:club_alt/presentation/theme/color/app_colors.dart';
import 'package:club_alt/presentation/theme/color/light_app_colors.dart';

class LightAppTheme extends AppTheme {
  @override
  AppColors appColors = LightAppColors();

  @override
  Brightness brightness = Brightness.light;
}
