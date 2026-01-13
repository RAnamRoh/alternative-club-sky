
import 'package:domain/model/skyClubModels/airport.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class AirportCard extends StatelessWidget {
  final Airport airport;
  final VoidCallback onTap;

  const AirportCard({super.key, required this.airport, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${airport.city}, ${airport.country}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: Dimens.dimen_14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    airport.name,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: Dimens.dimen_12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                airport.code,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: Dimens.dimen_16,
                  fontWeight: FontWeight.w500,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
