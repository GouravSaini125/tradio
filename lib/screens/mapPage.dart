import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;

  void mapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Track",
          style: TextStyle(
              fontFamily: "Josefin", color: Colors.black, fontSize: 25.0),
        ),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: mapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(28.2014, 76.8276),
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
