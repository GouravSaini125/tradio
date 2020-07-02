import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proto/screens/addressPage.dart';
import 'package:proto/screens/categories.dart';
import 'package:proto/screens/imgPicker.dart';
import 'package:proto/screens/postWork.dart';
import 'package:proto/screens/serviceDetails.dart';
import 'package:proto/screens/serviceList.dart';
import '../configs/ThemeColors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<String> category = [
  "Handyman",
  "Cleaning",
  "Electrical",
  "Plumber",
  "Pest Control",
  "Mechanic",
  "Lawn Mower"
];
List<String> categoryIcon = [
  "construction.png",
  "vacuum-cleaner.png",
  "electricity-bill.png",
  "plumber.png",
  "grasshopper.png",
  "repair.png",
  "planting.png"
];

List<String> popularImages = [
  "carpentry.jpg",
  "cleaning.jpg",
  "electrical.jpg",
  "gardening.jpeg"
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "fab",
        onPressed: () {
          Navigator.push(context, SlideUpRoute(page: PostWork()));
        },
        child: Icon(EvaIcons.plusOutline),
      ),
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
                              context, FadeRoute(page: Categories()));
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              SlideUpRoute(page: ServicesList(index: index)));
                        },
                        child: Hero(
                          tag: index.toString(),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                bottom: 20.0,
                                top: 10.0),
                            height: 60.0,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10.0,
                                      color: Colors.black12,
                                      offset: Offset(4, 7))
                                ],
                                // gradient: LinearGradient(
                                //     colors: ThemeColors.gradientsList[index],
                                //     begin: Alignment.topLeft,
                                //     end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(20.0),
                                color: ThemeColors.color[index]),
                            child: Material(
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Image.asset(
                                        "assets/icons/${categoryIcon[index]}",
                                        width: 50.0,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    category[index],
                                    style: TextStyle(
                                        fontFamily: "Quicksand",
                                        color: Colors.white,
                                        fontSize: 20.0),
                                  ),
                                ],
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
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Details(index: index)));
                          },
                          child: Hero(
                            tag: popularImages[index],
                            child: Container(
                              width: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/${popularImages[index]}",
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15.0),
                                // gradient: LinearGradient(
                                //     colors: ThemeColors.gradient2,
                                //     end: Alignment.bottomRight,
                                //     begin: Alignment.topLeft)
                              ),
                              margin: EdgeInsets.all(15.0),
                              child: Center(
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black38,
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      padding: EdgeInsets.only(
                                          bottom: 20.0,
                                          left: 10.0,
                                          right: 10.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Example",
                                              style: TextStyle(
                                                  fontSize: 30.0,
                                                  fontFamily: "Poiret",
                                                  color: Colors.white),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "15\$",
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontFamily: "Josefin",
                                                      color: Colors.white),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "4.5",
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontFamily: "Josefin",
                                                          color: Colors.white),
                                                    ),
                                                    Icon(
                                                      EvaIcons.star,
                                                      size: 15.0,
                                                      color: Colors.yellow,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(milliseconds: 700),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

class SlideUpRoute extends PageRouteBuilder {
  final Widget page;
  SlideUpRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
