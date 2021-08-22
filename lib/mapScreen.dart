import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:userstask/models/usersModels.dart';

class MapSample extends StatefulWidget {
  Geo userLoaction;
  MapSample({
    this.userLoaction,
  });

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex;

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, 37.42796133580664),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  void initState() {
    _kGooglePlex = CameraPosition(
      target: LatLng(double.parse(widget.userLoaction.lat),
          double.parse(widget.userLoaction.lng)),
      zoom: 14.4746,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('map'),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: openLocation,
        label: Text('go to location'),
        icon: Icon(Icons.location_city),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void openLocation() {
    MapsLauncher.launchCoordinates(double.parse(widget.userLoaction.lat),
        double.parse(widget.userLoaction.lng));
  }
}
