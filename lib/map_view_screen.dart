import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({Key? key}) : super(key: key);

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  Position? currentLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map View'),
      ),
      body: Center(
        child: Text(currentLocation.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //location permission
          LocationPermission permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.always ||
              permission == LocationPermission.whileInUse) {
            //current location fetch
            currentLocation = await Geolocator.getCurrentPosition();
            print(currentLocation);
            setState(() {});
          }else{
            print('Permission not allowed');
          }
        },
        child: Icon(Icons.location_on),
      ),
      // body:
      // GoogleMap(
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(23.793895737073488, 90.40448580672911)
      //   ),
      // ),
    );
  }
}
