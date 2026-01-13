import 'package:flutter/material.dart';
import 'package:sky_club/presentation/base/base_argument.dart';
import 'package:sky_club/presentation/base/base_route.dart';
import 'package:sky_club/presentation/feature/auth/login/route/login_argument.dart';
import 'package:sky_club/presentation/feature/bookform/route/bookform_argument.dart';
import 'package:sky_club/presentation/feature/bookingdetails/route/bookingdetails_argument.dart';
import 'package:sky_club/presentation/feature/cancel_booking/route/cancel_booking_argument.dart';
import 'package:sky_club/presentation/feature/edit_profile/route/edit_profile_argument.dart';
import 'package:sky_club/presentation/feature/explore/route/explore_argument.dart';
import 'package:sky_club/presentation/feature/otp_verification/route/otp_verification_argument.dart';
import 'package:sky_club/presentation/feature/searchticket/route/searchticket_argument.dart';
import 'package:sky_club/presentation/feature/settings/route/settings_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/route/check_email_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/email_for_reset/route/email_for_reset_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/route/reset_password_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/route/sky_login_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_signup/route/sky_signup_argument.dart';
import 'package:sky_club/presentation/feature/skybase/account/route/account_argument.dart';
import 'package:sky_club/presentation/feature/skybase/dashboard/route/dashboard_argument.dart';
import 'package:sky_club/presentation/feature/skybase/reward/route/reward_argument.dart';
import 'package:sky_club/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:sky_club/presentation/feature/skyhome/route/skyhome_argument.dart';
import 'package:sky_club/presentation/feature/splash/route/splash_argument.dart';
import 'package:sky_club/presentation/navigation/route_path.dart';

class AppRouter {
  static final initialRoute = RoutePath.splash.toPathString;

  static BaseArgument initialArguments = SplashArgument();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argObj = settings.arguments;

    BaseArgument? arguments;
    if (argObj == null) {
      arguments = initialArguments;
    }
    if (argObj is BaseArgument) {
      arguments = argObj;
    }
    if (settings.name == null) {
      throw Exception('Route name is null');
    }
    final String routeName = (settings.name == Navigator.defaultRouteName)
        ? initialRoute
        : settings.name!;
    final RoutePath routePath = RoutePath.fromString(routeName);
    final BaseRoute appRoute = routePath.getAppRoute(arguments: arguments);
    return appRoute.toMaterialPageRoute();
  }

  static Future<void> navigateTo(BuildContext context, BaseRoute appRoute) {
    return Navigator.pushNamed(
      context,
      appRoute.routePath.toPathString,
      arguments: appRoute.arguments,
    );
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<void> navigateToAndClearStack(
      BuildContext context, BaseRoute appRoute) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      appRoute.routePath.toPathString,
      (route) => false,
      arguments: appRoute.arguments,
    );
  }

  static Future<void> pushReplacement(
      BuildContext context, BaseRoute appRoute) {
    return Navigator.pushReplacementNamed(
      context,
      appRoute.routePath.toPathString,
      arguments: appRoute.arguments,
    );
  }
}
