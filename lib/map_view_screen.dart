import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({Key? key}) : super(key: key);

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map View'),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        onTap: (LatLng position) {
          print(position);
        },
        mapType: MapType.normal,
        //marker add
        markers: {
          Marker(
            markerId: MarkerId('bubt'),
            position: LatLng(23.811972774158328, 90.35684009419076),
            infoWindow: InfoWindow(title: 'Bubt'),
          ),
          Marker(
              markerId: MarkerId('Sheraton office'),
              position: LatLng(23.811543083199535, 90.3544619679451),
              infoWindow: InfoWindow(title: 'Sheraton office'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue)),
          Marker(
              markerId: MarkerId('draggable'),
              position: LatLng(23.81109463312196, 90.35585269331933),
              infoWindow: InfoWindow(title: 'Draggable'),
              draggable: true,
              onDrag: (LatLng initLatLng) {},
              onDragEnd: (LatLng onDragEnd) {},
              onDragStart: (LatLng onDragStart) {})
        },
        //circle add
        circles: {
          Circle(
              circleId: CircleId('office-circle'),
              center: LatLng(23.811972774158328, 90.35684009419076),
              radius: 50,
              fillColor: Colors.pink.shade100,
              strokeWidth: 2,
              strokeColor: Colors.pink),
          Circle(
              circleId: CircleId('sheraton-circle'),
              center: LatLng(23.811543083199535, 90.3544619679451),
              radius: 50,
              fillColor: Colors.pink.shade100,
              strokeWidth: 2,
              strokeColor: Colors.pink)
        },
        //polygon add

        // polygons: {
        //   Polygon(
        //     polygonId: PolygonId('abc'),
        //     visible: true,
        //     fillColor: Colors.teal.shade100,
        //     strokeWidth: 2,
        //     strokeColor: Colors.teal,
        //     points: [
        //       LatLng(23.8102428190993, 90.355999879539),
        //       LatLng(23.81352244112977, 90.35701576620339),
        //       LatLng(23.813421832931468, 90.35828981548548)
        //
        //     ]
        //   )
        // },
        initialCameraPosition: CameraPosition(
            target: LatLng(23.811972774158328, 90.35684009419076),
            zoom: 17,
            bearing: 40,
            tilt: 0),
      ),
    );
  }
}
