import 'package:flutter/material.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/screens/categories.dart';
import 'package:proto/screens/nearbyDetails.dart';

class ServiceManNearby extends StatefulWidget {
  @override
  _ServiceManNearbyState createState() => _ServiceManNearbyState();
}

class _ServiceManNearbyState extends State<ServiceManNearby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          tag: "appBar",
          child: Material(
            color: Colors.transparent,
            child: Text(
              "NearBy",
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      SlideUpRoute(
                          page: NearbyDetails(
                        heroTag: "booking$index",
                      )));
                },
                child: Hero(
                  tag: "booking$index",
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    height: 110,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: ThemeColors.gradient2,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFff5e62).withOpacity(0.2),
                            blurRadius: 10.0,
                            offset: Offset(1, 7))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Carpentry",
                                style: TextStyle(
                                    fontFamily: "Josefin",
                                    fontSize: 25.0,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: 35.0,
                                height: 35.0,
                                padding: EdgeInsets.all(7.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: Colors.black12),
                                child: Image.asset(
                                  "assets/icons/drill.png",
                                  width: 20.0,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "3/76, UIT Sector 3, Bhiwadi",
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 10.0),
                              ),
                              Text(
                                "2KM\nAway",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.0),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.green[300]),
                                  child: Text(
                                    "Accept",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Container(
                                  padding: EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.red[300]),
                                  child: Text(
                                    "Reject",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
