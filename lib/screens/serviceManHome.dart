import 'package:flutter/material.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/screens/bookingDetails.dart';
import 'package:proto/screens/categories.dart';

class ServiceManHome extends StatefulWidget {
  @override
  _ServiceManHomeState createState() => _ServiceManHomeState();
}

List<String> category = ["Handyman", "Cleaning", "Electrical", "Pest Control"];
List<String> categoryIcon = [
  "construction.png",
  "vacuum-cleaner.png",
  "electricity-bill.png",
  "grasshopper.png"
];

class _ServiceManHomeState extends State<ServiceManHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // backgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Hero(
          tag: "title",
          child: Material(
            color: Colors.transparent,
            child: Text(
              "Bookings",
              style: TextStyle(
                  fontFamily: "Josefin", color: Colors.black, fontSize: 25.0),
            ),
          ),
        ),
      ),
      body: Container(
        // color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: 4,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      SlideUpRoute(
                          page: BookingDetail(heroTag: "booking$index")));
                },
                child: Hero(
                  tag: "booking$index",
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF3a7bd5).withOpacity(0.1),
                              blurRadius: 10.0,
                              offset: Offset(1, 7))
                        ],
                        color: Colors.white
                        // gradient: LinearGradient(
                        //     colors: ThemeColors.gradient2,
                        //     begin: Alignment.topLeft,
                        //     end: Alignment.bottomRight)
                        ),
                    margin: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
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
                                    color: Colors.black),
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
                                "Total\n20\$",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.0),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Track Booking",
                              style: TextStyle(color: Colors.black54),
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
