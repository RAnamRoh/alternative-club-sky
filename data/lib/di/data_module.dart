import 'package:data/remote/api_client/api_client.dart';
import 'package:data/remote/api_client/booking_details_api_client.dart';
import 'package:data/remote/api_client/location_api_client.dart';
import 'package:data/remote/api_client/movie_api_client.dart';
import 'package:data/remote/api_client/reward_api_client.dart';
import 'package:data/remote/api_client/search_ticket_api_client.dart';
import 'package:data/remote/api_client/sky_club_api_client.dart';
import 'package:data/remote/api_service/auth_api_service.dart';
import 'package:data/remote/api_service/auth_api_service_impl.dart';
import 'package:data/remote/api_service/book_form_api_service.dart';
import 'package:data/remote/api_service/book_form_api_service_impl.dart';
import 'package:data/remote/api_service/explore_api_service.dart';
import 'package:data/remote/api_service/explore_api_service_impl.dart';
import 'package:data/remote/api_service/movie_api_service.dart';
import 'package:data/remote/api_service/movie_api_service_impl.dart';
import 'package:data/remote/api_service/sky_home_api_service.dart';
import 'package:data/remote/api_service/sky_home_api_service_impl.dart';
import 'package:data/repository/auth_repository_impl.dart';
import 'package:data/repository/book_form_repository_impl.dart';
import 'package:data/repository/explore_repository_impl.dart';
import 'package:data/repository/location_repository_impl.dart';
import 'package:data/repository/movie_repository_impl.dart';
import 'package:data/repository/sky_auth_repository_impl.dart';
import 'package:data/repository/sky_home_repository_impl.dart';
import 'package:domain/di/di_module.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/book_form_repository.dart';
import 'package:domain/repository/booking_details_repository.dart';
import 'package:domain/repository/explore_repository.dart';
import 'package:domain/repository/location_repository.dart';
import 'package:domain/repository/movie_repository.dart';
import 'package:domain/repository/reward_repository.dart';
import 'package:domain/repository/search_ticket_repository.dart';
import 'package:domain/repository/sky_auth_repository.dart';
import 'package:domain/repository/sky_home_repository.dart';

import '../remote/api_service/booking_details_api_service.dart';
import '../remote/api_service/booking_details_api_service_impl.dart';
import '../remote/api_service/reward_api_service.dart';
import '../remote/api_service/reward_api_service_impl.dart';
import '../remote/api_service/search_ticket_api_service.dart';
import '../remote/api_service/search_ticket_api_service_impl.dart';
import '../repository/booking_details_repository_impl.dart';
import '../repository/reward_repository_impl.dart';
import '../repository/search_ticket_repository_impl.dart';

class DataModule {
  DataModule._internal();

  static final DataModule _instance = DataModule._internal();

  factory DataModule() => _instance;

  final DiModule _diModule = DiModule();

  Future<void> injectDependencies() async {
    await injectApiClient();
    await injectApiService();
    await injectLocalDataService();
    await injectRepositories();
  }

  Future<void> removeDependencies() async {
    await removeApiClient();
    await removeApiService();
    await removeLocalDataService();
    await removeRepositories();
  }

  Future<void> injectApiClient() async {
    await _diModule.registerSingleton<ApiClient>(MovieApiClient());
    await _diModule.registerSingleton<SearchTicketApiClient>(SearchTicketApiClient());
    await _diModule.registerSingleton<RewardApiClient>(RewardApiClient());
    await _diModule.registerSingleton<BookingDetailsApiClient>(BookingDetailsApiClient());
    await _diModule.registerSingleton<SkyClubApiClient>(SkyClubApiClient());
    await _diModule.registerSingleton<LocationApiClient>(LocationApiClient());
  }

  Future<void> removeApiClient() async {
    await _diModule.unregisterSingleton<ApiClient>();
    await _diModule.unregisterSingleton<SearchTicketApiClient>();
    await _diModule.unregisterSingleton<RewardApiClient>();
    await _diModule.unregisterSingleton<BookingDetailsApiClient>();
    await _diModule.unregisterSingleton<SkyClubApiClient>();
    await _diModule.unregisterSingleton<LocationApiClient>();
  }

  Future<void> injectApiService() async {
    final apiClient = await _diModule.resolve<ApiClient>();
    final searchTicketApiClient = await _diModule.resolve<SearchTicketApiClient>();
    final rewardApiClient = await _diModule.resolve<RewardApiClient>();
    final bookingDetailsApiClient = await _diModule.resolve<BookingDetailsApiClient>();
    final skyClubApiClient = await _diModule.resolve<SkyClubApiClient>();
    final locationApiClient = await _diModule.resolve<LocationApiClient>();

    await _diModule.registerSingleton<MovieApiService>(
      MovieApiServiceImpl(apiClient: apiClient),
    );

    await _diModule.registerSingleton<SearchTicketApiService>(
      SearchTicketApiServiceImpl(apiClient: skyClubApiClient),
    );

    await _diModule.registerSingleton<RewardApiService>(
      RewardApiServiceImpl(apiClient: skyClubApiClient),
    );

    await _diModule.registerSingleton<BookingDetailsApiService>(
      BookingDetailsApiServiceImpl(apiClient: skyClubApiClient),
    );

    await _diModule.registerSingleton<SkyHomeApiService>(
      SkyHomeApiServiceImpl(apiClient: skyClubApiClient, locationApiClient: locationApiClient),
    );

    await _diModule.registerSingleton<ExploreApiService>(
      ExploreApiServiceImpl(apiClient: skyClubApiClient),
    );

    await _diModule.registerSingleton<AuthApiService>(
      AuthApiServiceImpl(apiClient: skyClubApiClient),
    );

    await _diModule.registerSingleton<BookFormApiService>(
      BookFormApiServiceImpl(apiClient: skyClubApiClient),
    );




  }

  Future<void> removeApiService() async {
    await _diModule.unregisterSingleton<MovieApiService>();
    await _diModule.unregisterSingleton<SearchTicketApiService>();
    await _diModule.unregisterSingleton<RewardApiService>();
    await _diModule.unregisterSingleton<BookingDetailsApiService>();
    await _diModule.unregisterSingleton<SkyHomeApiService>();
    await _diModule.unregisterSingleton<ExploreApiService>();
    await _diModule.unregisterSingleton<AuthApiService>();
    await _diModule.unregisterSingleton<BookFormApiService>();
  }

  Future<void> injectLocalDataService() async {
    //TODO: Implement local service injection
  }

  Future<void> removeLocalDataService() async {}

  Future<void> injectRepositories() async {
    final movieApiService = await _diModule.resolve<MovieApiService>();
    final searchTicketApiService = await _diModule.resolve<SearchTicketApiService>();
    final rewardApiService = await _diModule.resolve<RewardApiService>();
    final bookingDetailsApiService = await _diModule.resolve<BookingDetailsApiService>();
    final skyHomeApiService = await _diModule.resolve<SkyHomeApiService>();
    final exploreApiService = await _diModule.resolve<ExploreApiService>();
    final skyAuthApiService = await _diModule.resolve<AuthApiService>();
    final bookFormApiService = await _diModule.resolve<BookFormApiService>();

    await _diModule.registerSingleton<MovieRepository>(
      MovieRepositoryImpl(movieApiService: movieApiService),
    );

    await _diModule.registerSingleton<SearchTicketRepository>(
      SearchTicketRepositoryImpl(apiService: searchTicketApiService),
    );

    await _diModule.registerSingleton<RewardRepository>(
      RewardRepositoryImpl(apiService: rewardApiService),
    );

    await _diModule.registerSingleton<BookingDetailsRepository>(
      BookingDetailsRepositoryImpl(apiService: bookingDetailsApiService),
    );

    await _diModule.registerSingleton<SkyHomeRepository>(
      SkyHomeRepositoryImpl(apiService: skyHomeApiService),
    );

    await _diModule.registerSingleton<ExploreRepository>(
      ExploreRepositoryImpl(apiService: exploreApiService),
    );

    await _diModule.registerSingleton<SkyAuthRepository>(
      SkyAuthRepositoryImpl(skyAuthApiService: skyAuthApiService)
    );

    await _diModule.registerSingleton<AuthRepository>(AuthRepositoryImpl());

    await _diModule.registerSingleton<BookFormRepository>(BookFormRepositoryImpl(apiService: bookFormApiService));

    await _diModule
        .registerSingleton<LocationRepository>(LocationRepositoryImpl());
  }

  Future<void> removeRepositories() async {
    await _diModule.unregisterSingleton<MovieRepository>();
    await _diModule.unregisterSingleton<SearchTicketRepository>();
    await _diModule.unregisterSingleton<RewardRepository>();
    await _diModule.unregisterSingleton<BookingDetailsRepository>();
    await _diModule.unregisterSingleton<SkyHomeRepository>();
    await _diModule.unregisterSingleton<ExploreRepository>();
    await _diModule.unregisterSingleton<SkyAuthRepository>();
    await _diModule.unregisterSingleton<AuthRepository>();
    await _diModule.unregisterSingleton<BookFormRepository>();
  }
}
