import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:proto/configs/ThemeColors.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  GoogleMapController mapController;
  String mapStyle;

  void mapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(mapStyle);
  }

  Set<Marker> _markers = {};

  void markerTap(LatLng latLng) {
    setState(() {
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  @override
  void initState() {
    super.initState();

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
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GoogleMap(
                onTap: markerTap,
                onMapCreated: mapCreated,
                markers: _markers,
                initialCameraPosition: CameraPosition(
                  target: LatLng(28.2014, 76.8276),
                  zoom: 15.0,
                ),
              ),
            ),
            Positioned(
              right: 30,
              top: MediaQuery.of(context).size.height / 1.5,
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  gradient: LinearGradient(
                      colors: ThemeColors.gradient2,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Icon(
                  Icons.gps_fixed,
                  size: 35.0,
                  color: Colors.black,
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.2,
              maxChildSize: 0.55,
              minChildSize: 0.2,
              builder: (context, controller) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                    ),
                    padding:
                        EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      controller: controller,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Address",
                          textAlign: TextAlign.left,
                          style:
                              TextStyle(fontFamily: "Josefin", fontSize: 30.0),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Josefin",
                          ),
                          decoration: InputDecoration(
                            hintText: "Enter Street Address",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF1165C1), width: 2.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Josefin",
                          ),
                          decoration: InputDecoration(
                            hintText: "Enter Landmark",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF1165C1), width: 2.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Hero(
                            tag: "nextButton",
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                  // color: Color(0xFF1165C1),
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF396afc),
                                        Color(0xFF2948ff)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(57, 106, 252, 0.3),
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
                          ),
                        ),
                      ],
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
