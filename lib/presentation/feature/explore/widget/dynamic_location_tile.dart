import 'package:flutter/material.dart';
import 'package:club_alt/presentation/common/skyClubWidgets/image_tile_card.dart';
import 'package:domain/model/skyClubModels/travelLocation.dart';

class DynamicLocationTiles extends StatelessWidget {
  final List<TravelLocation> travelLocations;

  const DynamicLocationTiles({super.key, required this.travelLocations});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: travelLocations.isNotEmpty
          ? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2, // 3 columns for wider screens
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8, // Controls the height/width ratio of the cards
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: travelLocations.length,
        itemBuilder: (context, index) {
          final location = travelLocations[index];
          return ImageTileCard(
            imageUrl: location.imageUrl,
            title: location.name,
            description: location.description,
            onButtonPressed: () {
              // Navigate to the desired screen
            },
          );
        },
      )
          : const Center(child: Text('No locations available')),
    );
  }
}
