import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  

  @override
  State<MapSample> createState() => MapSampleState();


}

class MapSampleState extends State<MapSample> {

  Completer<GoogleMapController> _controller = Completer();

  List<Marker> _markerss = [];
  BitmapDescriptor _markerIcon;


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.103591549634345, 129.38800959286618),
    zoom: 17,
  );

  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set<Marker>.of(markers.values), // YOUR MARKS IN MAP
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationButtonEnabled: true,
      ),
    );
  }
}
