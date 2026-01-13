
import 'package:data/remote/response/explore/top_destination_response.dart';
import 'package:domain/model/skyClubModels/travelLocation.dart';

class TopDestinationMapper {

  static TravelLocation topDestinationToTravelLocation({required TopDestinationResponse response}) {

    final TravelLocation travelLocation =
        TravelLocation(
            name: response.title,
            description: response.subTitle,
            imageUrl: response.imageUrl,
        );

    return travelLocation;


  }

  static List<TravelLocation> topDestinationsListToTravelLocationsList({required List<TopDestinationResponse> destinations}) {
    return destinations.map((destination) => topDestinationToTravelLocation(response: destination)).toList();
  }


}