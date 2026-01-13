import 'package:club_alt/presentation/feature/otp_verification/route/otp_verification_argument.dart';
import 'package:club_alt/presentation/feature/otp_verification/route/otp_verification_route.dart';
import 'package:club_alt/presentation/feature/bookingdetails/page/ticket_cancel/route/ticket_cancel_argument.dart';
import 'package:club_alt/presentation/feature/bookingdetails/page/ticket_cancel/route/ticket_cancel_route.dart';
import 'package:club_alt/presentation/feature/skybase/reward/page/subscription_cancel/route/subscription_cancel_argument.dart';
import 'package:club_alt/presentation/feature/skybase/reward/page/subscription_cancel/route/subscription_cancel_route.dart';
import 'package:club_alt/presentation/feature/payment_web_view/route/payment_web_view_argument.dart';
import 'package:club_alt/presentation/feature/payment_web_view/route/payment_web_view_route.dart';
import 'package:club_alt/presentation/feature/cancel_booking/route/cancel_booking_argument.dart';
import 'package:club_alt/presentation/feature/cancel_booking/route/cancel_booking_route.dart';
import 'package:club_alt/presentation/feature/splash/route/splash_argument.dart';
import 'package:club_alt/presentation/feature/splash/route/splash_route.dart';
import 'package:club_alt/presentation/feature/edit_profile/route/edit_profile_argument.dart';
import 'package:club_alt/presentation/feature/edit_profile/route/edit_profile_route.dart';
import 'package:club_alt/presentation/feature/skybase/account/route/account_argument.dart';
import 'package:club_alt/presentation/feature/skybase/account/route/account_route.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/reset_password/route/reset_password_argument.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/reset_password/route/reset_password_route.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/check_email/route/check_email_argument.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/check_email/route/check_email_route.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/email_for_reset/route/email_for_reset_argument.dart';
import 'package:club_alt/presentation/feature/skyAuth/resetPassword/email_for_reset/route/email_for_reset_route.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_signup/route/sky_signup_argument.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_signup/route/sky_signup_route.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_login/route/sky_login_argument.dart';
import 'package:club_alt/presentation/feature/skyAuth/sky_login/route/sky_login_route.dart';
import 'package:club_alt/presentation/feature/destination_details/route/destination_details_argument.dart';
import 'package:club_alt/presentation/feature/destination_details/route/destination_details_route.dart';
import 'package:club_alt/presentation/feature/bookingdetails/route/bookingdetails_argument.dart';
import 'package:club_alt/presentation/feature/bookingdetails/route/bookingdetails_route.dart';
import 'package:club_alt/presentation/feature/skybase/reward/route/reward_argument.dart';
import 'package:club_alt/presentation/feature/skybase/reward/route/reward_route.dart';
import 'package:club_alt/presentation/feature/bookform/route/bookform_argument.dart';
import 'package:club_alt/presentation/feature/bookform/route/bookform_route.dart';
import 'package:club_alt/presentation/feature/skybase/dashboard/route/dashboard_argument.dart';
import 'package:club_alt/presentation/feature/skybase/dashboard/route/dashboard_route.dart';
import 'package:club_alt/presentation/feature/explore/route/explore_argument.dart';
import 'package:club_alt/presentation/feature/explore/route/explore_route.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_route.dart';
import 'package:club_alt/presentation/feature/searchticket/route/searchticket_argument.dart';
import 'package:club_alt/presentation/feature/searchticket/route/searchticket_route.dart';
import 'package:club_alt/presentation/feature/skyhome/route/skyhome_argument.dart';
import 'package:club_alt/presentation/feature/skyhome/route/skyhome_route.dart';
import 'package:club_alt/presentation/base/base_argument.dart';
import 'package:club_alt/presentation/base/base_route.dart';
import 'package:club_alt/presentation/feature/auth/login/route/login_argument.dart';
import 'package:club_alt/presentation/feature/auth/login/route/login_route.dart';
import 'package:club_alt/presentation/feature/home/movie_list/route/movie_list_argument.dart';
import 'package:club_alt/presentation/feature/home/movie_list/route/movie_list_route.dart';
import 'package:club_alt/presentation/feature/home/route/home_argument.dart';
import 'package:club_alt/presentation/feature/home/route/home_route.dart';
import 'package:club_alt/presentation/feature/movieDetails/route/movie_details_argument.dart';
import 'package:club_alt/presentation/feature/movieDetails/route/movie_details_route.dart';
import 'package:club_alt/presentation/feature/settings/route/settings_argument.dart';
import 'package:club_alt/presentation/feature/settings/route/settings_route.dart';
import 'package:club_alt/presentation/navigation/unknown_page_route.dart';

enum RoutePath {
  login,
  home,
  movieList,
  movieSearch,
  movieBookmark,
  setting,
  movieDetails,
  skyhome,
  searchticket,
  skybase,
  explore,
  dashboard,
  bookform,
  reward,
  bookingdetails,
  destinationDetails,
  skyLogin,
  skySignup,
  emailForReset,
  checkEmail,
  resetPassword,
  account,
  editProfile,
  splash,
  cancelBooking,
  paymentWebView,
  subscriptionCancel,
  ticketCancel,
  otpVerification, 
  unknown;

  static RoutePath fromString(String? path) {
    switch (path) {
      case '/login':
        return RoutePath.login;
      case '/home':
        return RoutePath.home;
      case '/movieList':
        return RoutePath.movieList;
      case '/movieSearch':
        return RoutePath.movieSearch;
      case '/movieBookmark':
        return RoutePath.movieBookmark;
      case '/setting':
        return RoutePath.setting;
      case '/movieDetails':
        return RoutePath.movieDetails;
      case '/skyhome':
        return RoutePath.skyhome;
      case '/searchticket':
        return RoutePath.searchticket;
      case '/skybase':
        return RoutePath.skybase;
      case '/explore':
        return RoutePath.explore;
      case '/dashboard':
        return RoutePath.dashboard;
      case '/bookform':
        return RoutePath.bookform;
      case '/reward':
        return RoutePath.reward;
      case '/bookingdetails':
        return RoutePath.bookingdetails;
      case '/destinationDetails':
        return RoutePath.destinationDetails;
      case '/skyLogin':
        return RoutePath.skyLogin;
      case '/skySignup':
        return RoutePath.skySignup;
      case '/emailForReset':
        return RoutePath.emailForReset;
      case '/checkEmail':
        return RoutePath.checkEmail;
      case '/resetPassword':
        return RoutePath.resetPassword;
      case '/account':
        return RoutePath.account;
      case '/editProfile':
        return RoutePath.editProfile;
      case '/splash':
        return RoutePath.splash;
      case '/cancelBooking':
        return RoutePath.cancelBooking;
      case '/paymentWebView':
        return RoutePath.paymentWebView;
      case '/subscriptionCancel':
        return RoutePath.subscriptionCancel;
      case '/ticketCancel':
        return RoutePath.ticketCancel;
      case '/otpVerification':
        return RoutePath.otpVerification;
      default:
        return RoutePath.unknown;
    }
  }

  String get toPathString {
    switch (this) {
      case RoutePath.login:
        return '/login';
      case RoutePath.home:
        return '/home';
      case RoutePath.movieList:
        return '/movieList';
      case RoutePath.movieSearch:
        return '/movieSearch';
      case RoutePath.movieBookmark:
        return '/movieBookmark';
      case RoutePath.setting:
        return '/setting';
      case RoutePath.movieDetails:
        return '/movieDetails';

      case RoutePath.skyhome:
        return '/skyhome';
      case RoutePath.searchticket:
        return '/searchticket';
      case RoutePath.skybase:
        return '/skybase';
      case RoutePath.explore:
        return '/explore';
      case RoutePath.dashboard:
        return '/dashboard';
      case RoutePath.bookform:
        return '/bookform';
      case RoutePath.reward:
        return '/reward';
      case RoutePath.bookingdetails:
        return '/bookingdetails';
      case RoutePath.destinationDetails:
        return '/destinationDetails';
      case RoutePath.skyLogin:
        return '/skyLogin';
      case RoutePath.skySignup:
        return '/skySignup';
      case RoutePath.emailForReset:
        return '/emailForReset';
      case RoutePath.checkEmail:
        return '/checkEmail';
      case RoutePath.resetPassword:
        return '/resetPassword';
      case RoutePath.account:
        return '/account';
      case RoutePath.editProfile:
        return '/editProfile';
      case RoutePath.splash:
        return '/splash';
      case RoutePath.cancelBooking:
        return '/cancelBooking';
      case RoutePath.paymentWebView:
        return '/paymentWebView';
      case RoutePath.subscriptionCancel:
        return '/subscriptionCancel';
      case RoutePath.ticketCancel:
        return '/ticketCancel';
      case RoutePath.otpVerification:
        return '/otpVerification';
      default:
        return '';
    }
  }

  BaseRoute getAppRoute({BaseArgument? arguments}) {
    switch (this) {
      case RoutePath.login:
        return LoginRoute(
          arguments: arguments as LoginArgument?,
        );
      case RoutePath.home:
        if (arguments is! HomeArgument) {
          throw Exception('HomeArgument is required');
        }
        return HomeRoute(arguments: arguments);
      case RoutePath.movieList:
        if (arguments is! MovieListArgument) {
          throw Exception('MovieListArgument is required');
        }
        return MovieListRoute(arguments: arguments);
      case RoutePath.movieDetails:
        if (arguments is! MovieDetailsArgument) {
          throw Exception('MovieDetailsArgument is required');
        }
        return MovieDetailsRoute(arguments: arguments);
      case RoutePath.setting:
        if (arguments is! SettingsArgument) {
          throw Exception('SettingsArgument is required');
        }
        return SettingsRoute(arguments: arguments);

      case RoutePath.skyhome:
        if (arguments is! SkyhomeArgument) {
          throw Exception('SkyhomeArgument is required');
        }
        return SkyhomeRoute(arguments: arguments);
      case RoutePath.searchticket:
        if (arguments is! SearchticketArgument) {
          throw Exception('SearchticketArgument is required');
        }
        return SearchticketRoute(arguments: arguments);

      case RoutePath.skybase:
        if (arguments is! SkybaseArgument) {
          throw Exception('SkybaseArgument is required');
        }
        return SkybaseRoute(arguments: arguments);
      case RoutePath.explore:
        if (arguments is! ExploreArgument) {
          throw Exception('ExploreArgument is required');
        }
        return ExploreRoute(arguments: arguments);
      case RoutePath.dashboard:
        if (arguments is! DashboardArgument) {
          throw Exception('DashboardArgument is required');
        }
        return DashboardRoute(arguments: arguments);
      case RoutePath.bookform:
        if (arguments is! BookformArgument) {
          throw Exception('BookformArgument is required');
        }
        return BookformRoute(arguments: arguments);
      case RoutePath.reward:
        if (arguments is! RewardArgument) {
          throw Exception('RewardArgument is required');
        }
        return RewardRoute(arguments: arguments);
      case RoutePath.bookingdetails:
        if (arguments is! BookingdetailsArgument) {
          throw Exception('BookingdetailsArgument is required');
        }
        return BookingdetailsRoute(arguments: arguments);
      case RoutePath.destinationDetails:
        if (arguments is! DestinationDetailsArgument) {
          throw Exception('DestinationDetailsArgument is required');
        }
        return DestinationDetailsRoute(arguments: arguments);
      case RoutePath.skyLogin:
        if (arguments is! SkyLoginArgument) {
          throw Exception('SkyLoginArgument is required');
        }
        return SkyLoginRoute(arguments: arguments);
      case RoutePath.skySignup:
        if (arguments is! SkySignupArgument) {
          throw Exception('SkySignupArgument is required');
        }
        return SkySignupRoute(arguments: arguments);
      case RoutePath.emailForReset:
        if (arguments is! EmailForResetArgument) {
          throw Exception('EmailForResetArgument is required');
        }
        return EmailForResetRoute(arguments: arguments);
      case RoutePath.checkEmail:
        if (arguments is! CheckEmailArgument) {
          throw Exception('CheckEmailArgument is required');
        }
        return CheckEmailRoute(arguments: arguments);
      case RoutePath.resetPassword:
        if (arguments is! ResetPasswordArgument) {
          throw Exception('ResetPasswordArgument is required');
        }
        return ResetPasswordRoute(arguments: arguments);
      case RoutePath.account:
        if (arguments is! AccountArgument) {
          throw Exception('AccountArgument is required');
        }
        return AccountRoute(arguments: arguments);
      case RoutePath.editProfile:
        if (arguments is! EditProfileArgument) {
          throw Exception('EditProfileArgument is required');
        }
        return EditProfileRoute(arguments: arguments);
      case RoutePath.splash:
        if (arguments is! SplashArgument) {
          throw Exception('SplashArgument is required');
        }
        return SplashRoute(arguments: arguments);
      case RoutePath.cancelBooking:
        if (arguments is! CancelBookingArgument) {
          throw Exception('CancelBookingArgument is required');
        }
        return CancelBookingRoute(arguments: arguments);
      case RoutePath.paymentWebView:
        if (arguments is! PaymentWebViewArgument) {
          throw Exception('PaymentWebViewArgument is required');
        }
        return PaymentWebViewRoute(arguments: arguments);
      case RoutePath.subscriptionCancel:
        if (arguments is! SubscriptionCancelArgument) {
          throw Exception('SubscriptionCancelArgument is required');
        }
        return SubscriptionCancelRoute(arguments: arguments);
      case RoutePath.ticketCancel:
        if (arguments is! TicketCancelArgument) {
          throw Exception('TicketCancelArgument is required');
        }
        return TicketCancelRoute(arguments: arguments);
      case RoutePath.otpVerification:
        if (arguments is! OtpVerificationArgument) {
          throw Exception('OtpVerificationArgument is required');
        }
        return OtpVerificationRoute(arguments: arguments);
      default:
        return UnknownRoute(arguments: arguments);
    }
  }
}
