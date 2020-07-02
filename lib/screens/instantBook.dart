import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class InstantBook extends StatefulWidget {
  @override
  _InstantBookState createState() => _InstantBookState();
}

class _InstantBookState extends State<InstantBook> {
  GoogleMapController mapController;
  String mapStyle;

  void mapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(mapStyle);
  }

  Set<Marker> _markers = {};
  void initMarkers() {
    _markers.add(Marker(
      onTap: () {
        serviceManInfo(context);
      },
      markerId: MarkerId("0"),
      position: LatLng((28.2014 + 0.001), (76.8276)),
      icon: BitmapDescriptor.defaultMarker,
    ));
    _markers.add(Marker(
      onTap: () {
        serviceManInfo(context);
      },
      markerId: MarkerId("1"),
      position: LatLng((28.2014), (76.8276 + 0.002)),
      icon: BitmapDescriptor.defaultMarker,
    ));
    _markers.add(Marker(
      onTap: () {
        serviceManInfo(context);
      },
      markerId: MarkerId("2"),
      position: LatLng((28.2014 + 0.003), (76.8276 + 0.002)),
      icon: BitmapDescriptor.defaultMarker,
    ));
    _markers.add(Marker(
      onTap: () {
        serviceManInfo(context);
      },
      markerId: MarkerId("3"),
      position: LatLng((28.2014 + 0.004), (76.8276 + 0.001)),
      icon: BitmapDescriptor.defaultMarker,
    ));
    _markers.add(Marker(
      onTap: () {
        serviceManInfo(context);
      },
      markerId: MarkerId("4"),
      position: LatLng((28.2014 + 0.003), (76.8276 + 0.005)),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }

  @override
  void initState() {
    super.initState();
    initMarkers();
    rootBundle.loadString('assets/map/darkMapStyle.txt').then((string) {
      mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GoogleMap(
            onMapCreated: mapCreated,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(28.2014, 76.8276),
              zoom: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}

Future<Widget> serviceManInfo(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0))),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0.0),
          height: 300,
          child: Column(
            children: <Widget>[
              Text(
                "Service man",
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
              Text(
                "address",
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                    // color: Color(0xFF1165C1),
                    gradient: LinearGradient(
                        colors: [Color(0xFF396afc), Color(0xFF2948ff)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(57, 106, 252, 0.3),
                          blurRadius: 10.0,
                          offset: Offset(3, 7.0))
                    ],
                    borderRadius: BorderRadius.circular(50.0)),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                      icon: Icon(
                        EvaIcons.arrowCircleRight,
                        color: Colors.white,
                        size: 50.0,
                      ),
                      onPressed: () {}),
                ),
              ),
            ],
          ),
        );
      });
}
