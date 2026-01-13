
import 'package:data/remote/api_client/api_client.dart';
import 'package:data/remote/api_service/explore_api_service.dart';
import 'package:data/remote/response/explore/offer_response.dart';
import 'package:data/remote/response/explore/top_destination_response.dart';

class ExploreApiServiceImpl implements ExploreApiService {

  final ApiClient apiClient;

  ExploreApiServiceImpl({required this.apiClient});

  @override
  Future<List<TopDestinationResponse>> getTrendingDestinations() async {

    final response = await apiClient.get('common/topDestinations');
    final items = response['items'] as List<dynamic>;

    final destinations = items.map((json){
      return TopDestinationResponse.fromJson(json);
    }).toList();

    return destinations;

  }

  @override
  Future<List<OfferResponse>> getOffers() async {

    final response = await apiClient.get('common/offers');
    final items = response['items'] as List<dynamic>;

    final offerList = items.map((offer){
      return OfferResponse.fromJson(offer);
    }).toList();

    return offerList;
  }




}