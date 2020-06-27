import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proto/screens/categories.dart';
import '../configs/ThemeColors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<String> category = ["Handyman", "Cleaning", "Electrical", "Pest Control"];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Container(
                  height: 60.0,
                  padding: EdgeInsets.only(left: 10.0),
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      // color: Color(0xFFfea700),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF3a7bd5).withOpacity(0.1),
                            blurRadius: 10.0,
                            offset: Offset(1, 7))
                      ],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for Services"),
                          ),
                        ),
                        Hero(
                          tag: "search",
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                                icon: Icon(EvaIcons.search), onPressed: () {}),
                          ),
                        ),
                        SizedBox(
                          width: 25.0,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Hero(
                        tag: "category",
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            "Categories",
                            style: TextStyle(
                                fontFamily: "Josefin", fontSize: 30.0),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 700),
                                  pageBuilder: (_, __, ___) => Categories()));
                        },
                        child: Text(
                          "See All",
                          style:
                              TextStyle(fontFamily: "Josefin", fontSize: 20.0),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: category.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Hero(
                        tag: index.toString(),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 20.0, top: 10.0),
                          height: 60.0,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10.0,
                                    color: Color(0xFF3a7bd5).withOpacity(0.2),
                                    offset: Offset(0, 10))
                              ],
                              gradient: LinearGradient(
                                  colors: ThemeColors.gradient3,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black),
                          child: Center(
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                category[index],
                                style: TextStyle(
                                    fontFamily: "Quicksand",
                                    color: Colors.white,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, bottom: 20.0, top: 20.0),
                  child: Text(
                    "Popular",
                    style: TextStyle(fontFamily: "Josefin", fontSize: 30.0),
                  ),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: LinearGradient(
                                  colors: ThemeColors.gradient2,
                                  end: Alignment.bottomRight,
                                  begin: Alignment.topLeft)),
                          margin: EdgeInsets.all(15.0),
                          child: Center(
                            child: Text(
                              "Example",
                              style: TextStyle(
                                  fontFamily: "Poiret", color: Colors.white),
                            ),
                          ),
                        );
                      }),
                )
              ],
            )),
      ),
    );
  }
}
