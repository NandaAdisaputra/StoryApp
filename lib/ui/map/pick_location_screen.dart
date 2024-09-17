import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:storyappsdicoding/utils/common.dart';
import 'package:storyappsdicoding/widget/place_mark_widget.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({super.key});

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  final LatLng mosque = const LatLng(-6.975769125375287, 110.47489843768892);
  late GoogleMapController mapController;
  late final Set<Marker> markers = {};
  geo.Placemark? placeMark;
  MapType _currentMapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.selectLocation),
        actions: [
          PopupMenuButton<MapType>(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<MapType>>[
              const PopupMenuItem<MapType>(
                value: MapType.normal,
                child: Text('Normal'),
              ),
              const PopupMenuItem<MapType>(
                value: MapType.satellite,
                child: Text('Satellite'),
              ),
              const PopupMenuItem<MapType>(
                value: MapType.terrain,
                child: Text('Terrain'),
              ),
              const PopupMenuItem<MapType>(
                value: MapType.hybrid,
                child: Text('Hybrid'),
              ),
            ],
            onSelected: (MapType result) {
              setState(() {
                _currentMapType = result;
              });
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "position",
            onPressed: () {
              final marker = markers.first;
              GoRouter.of(context).pop(marker.position);
            },
            child: const Icon(Icons.check),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "zoom-in",
            onPressed: () {
              mapController.animateCamera(
                CameraUpdate.zoomIn(),
              );
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "zoom-out",
            onPressed: () {
              mapController.animateCamera(
                CameraUpdate.zoomOut(),
              );
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "new-lat",
            onPressed: () {
              mapController.animateCamera(
                CameraUpdate.newLatLngZoom(mosque, 18),
              );
            },
            child: const Icon(Icons.location_searching),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            GoogleMap(
              mapType: _currentMapType,
              initialCameraPosition: CameraPosition(
                zoom: 18,
                target: mosque,
              ),
              markers: markers,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              onMapCreated: (controller) async {
                mapController = controller;
                final info = await geo.placemarkFromCoordinates(
                  mosque.latitude,
                  mosque.longitude,
                );
                final place = info.first;
                setState(() {
                  placeMark = place;
                });
                _defineMarker(
                  mosque,
                  place.street!,
                  _formatAddress(place),
                );
              },
              onLongPress: (LatLng latLng) =>
                  _onLongPressGoogleMap(latLng),
            ),
            if (placeMark != null)
              Positioned(
                top: 16,
                right: 16,
                left: 16,
                child: PlaceMarkWidget(placeMark: placeMark!),
              ),
          ],
        ),
      ),
    );
  }

  void _onLongPressGoogleMap(LatLng latLng) async {
    final info = await geo.placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );
    final place = info.first;
    setState(() {
      placeMark = place;
    });
    _defineMarker(latLng, place.street!, _formatAddress(place));
    mapController.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  void _defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
      draggable: true,
      onDragEnd: (newLatLng) => _updateMarkerPosition(newLatLng),
      infoWindow: InfoWindow(
        title: street,
        snippet: address,
      ),
    );
    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }

  void _updateMarkerPosition(LatLng newLatLng) async {
    final info = await geo.placemarkFromCoordinates(
      newLatLng.latitude,
      newLatLng.longitude,
    );
    final place = info.first;
    setState(() {
      placeMark = place;
    });
  }

  String _formatAddress(geo.Placemark place) {
    return '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }
}
