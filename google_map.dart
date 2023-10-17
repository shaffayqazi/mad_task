import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomepageMyApp extends StatefulWidget {
  @override
  _HomepageMyAppState createState() => _HomepageMyAppState();
}

class _HomepageMyAppState extends State<HomepageMyApp> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body:Stack(
  children: <Widget>[
    GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.topRight,
        child: FloatingActionButton(
          onPressed: () => print('button pressed'),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          backgroundColor: Colors.green,
          child: const Icon(Icons.map, size: 36.0),
        ),
      ),
    ),
  ],
),
      ),
    );
  }
}