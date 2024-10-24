import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  static const LatLng _center = LatLng(12.8221, 80.0444); // Coordinates for your courts

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Court Locations'),
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('court1'),
            position: LatLng(12.8210, 80.0430), // Example court location
            infoWindow: InfoWindow(title: 'Court 1'),
          ),
          const Marker(
            markerId: MarkerId('court2'),
            position: LatLng(12.8230, 80.0450), // Example court location
            infoWindow: InfoWindow(title: 'Court 2'),
          ),
        },
      ),
    );
  }
}
