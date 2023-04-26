import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoLocatorScreen extends StatefulWidget {
  const GeoLocatorScreen({Key? key}) : super(key: key);

  @override
  State<GeoLocatorScreen> createState() => _GeoLocatorScreenState();
}

class _GeoLocatorScreenState extends State<GeoLocatorScreen> {
  Position? currentLocation;

  void listenToLatestLocation() {
    Geolocator.getPositionStream(
            locationSettings: LocationSettings(
                accuracy: LocationAccuracy.high,
                distanceFilter: 5,
                timeLimit: Duration(seconds: 3)
            ))
        .listen((event) {
      print(event);
    });
  }

  @override
  void initState() {
    listenToLatestLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocator View'),
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
          } else {
            print('Permission not allowed');
          }
        },
        child: Icon(Icons.location_on),
      ),
    );
  }
}
