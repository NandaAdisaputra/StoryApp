import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;

class PlaceMarkWidget extends StatelessWidget {
  const PlaceMarkWidget({
    super.key,
    required this.placeMark,
  });

  final geo.Placemark placeMark;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              offset: Offset.zero,
              color: Colors.deepOrangeAccent.withOpacity(0.3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              placeMark.street!,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            Text(
              _formatAddress(placeMark),
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }

  String _formatAddress(geo.Placemark place) {
    return '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }
}
