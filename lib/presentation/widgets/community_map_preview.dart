import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CommunityMapPreview extends StatelessWidget {
  const CommunityMapPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(-6.200000, 106.816666), // Jakarta coordinates
            zoom: 12,
          ),
          markers: {
            const Marker(
              markerId: MarkerId('community_center'),
              position: LatLng(-6.200000, 106.816666),
              infoWindow: InfoWindow(title: 'Pusat Komunitas'),
            ),
          },
        ),
      ),
    );
  }
}