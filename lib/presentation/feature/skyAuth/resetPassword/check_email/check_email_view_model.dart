import 'package:flutter/foundation.dart';
import 'package:sky_club/presentation/base/base_viewmodel.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/check_email/route/check_email_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/route/reset_password_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/resetPassword/reset_password/route/reset_password_route.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/route/sky_login_argument.dart';
import 'package:sky_club/presentation/feature/skyAuth/sky_login/route/sky_login_route.dart';
import 'package:url_launcher/url_launcher.dart';


class CheckEmailViewModel extends BaseViewModel<CheckEmailArgument> {
  CheckEmailViewModel();

  @override
  void onViewReady({CheckEmailArgument? argument}) {
    super.onViewReady();
  }

  void onClickToLogin() {
    navigateToScreen(
      destination: SkyLoginRoute(arguments: SkyLoginArgument()),
      isClearBackStack: true,
    );
  }

  void onClickToViewEmail() {
    //navigateToScreen(destination: ResetPasswordRoute(arguments: ResetPasswordArgument()));
    openEmailApp();
  }

  Future<void> openEmailApp1() async {
    final Uri emailUri = Uri(scheme: 'mailto');

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open the email app';
    }
  }
  Future<void> openEmailApp() async {
    // Using Uri(scheme: 'mailto') without a specific recipient, subject, or body
    // will typically open the chosen email client to a new, blank compose screen.
    final Uri emailUri = Uri(scheme: 'mailto');

    if (await canLaunchUrl(emailUri)) {
      try {
        // LaunchMode.externalApplication is crucial here.
        // It signals the OS to open the URI using an external application.
        // For 'mailto:' URIs, this means an email client. The OS handles
        // the app selection process, which may include an app chooser.
        await launchUrl(
          emailUri,
          mode: LaunchMode.externalApplication,
        );
      } catch (e) {
        // It's good practice to log the actual error for debugging.
        debugPrint('Error launching email app: $e');
        throw 'Could not launch the email app. Please try again or check your device settings.';
      }
    } else {
      // This case means no application on the device can handle 'mailto:' URIs.
      debugPrint('No email app found that can handle mailto: links.');
      throw 'Could not open an email app. Please ensure an email client is installed.';
    }
  }




}
