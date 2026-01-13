import 'package:flutter/material.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/image_tile_card.dart';
import 'package:sky_club/presentation/values/dimens.dart';
import 'package:domain/model/skyClubModels/travelLocation.dart';

class LocationTiles extends StatelessWidget {
  final List<TravelLocation> travelLocations;

  const LocationTiles({super.key, required this.travelLocations});

  @override
  Widget build(BuildContext context) {
    // Ensure the list has enough items to avoid runtime errors
    if (travelLocations.length < 6) {
      return const Center(child: Text('Not enough locations available'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          _buildFullWidthTile(travelLocations[0], Dimens.dimen_300),
          SizedBox(height: Dimens.dimen_10),
          _buildTwoColumnRow(travelLocations[1], travelLocations[2], 194),
          SizedBox(height: Dimens.dimen_10),
          _buildFullWidthTile(travelLocations[3], Dimens.dimen_150),
          SizedBox(height: Dimens.dimen_10),
          _buildTwoColumnRow(travelLocations[4], travelLocations[5], 194),
        ],
      ),
    );
  }

  Widget _buildFullWidthTile(TravelLocation location, double height) {
    return ImageTileCard(
      imageUrl: location.imageUrl,
      title: location.name,
      description: location.description,
      onButtonPressed: () {},
      width: double.infinity,
      height: height,
    );
  }

  Widget _buildTwoColumnRow(TravelLocation location1, TravelLocation location2, double height) {
    return Row(
      children: [
        Expanded(
          child: ImageTileCard(
            imageUrl: location1.imageUrl,
            title: location1.name,
            description: location1.description,
            onButtonPressed: () {},
            height: height,
          ),
        ),
        SizedBox(width: Dimens.dimen_10), // Add spacing between the cards
        Expanded(
          child: ImageTileCard(
            imageUrl: location2.imageUrl,
            title: location2.name,
            description: location2.description,
            onButtonPressed: () {},
            height: height,
          ),
        ),
      ],
    );
  }
}
