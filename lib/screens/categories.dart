import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/screens/homePart.dart';
import 'package:proto/screens/serviceList.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

List<String> category = [
  "Handyman",
  "Cleaning",
  "Electrical",
  "Pest Control",
  "Mechanical",
  "Lawn Mower"
];
List<String> categoryIcon = [
  "construction.png",
  "vacuum-cleaner.png",
  "electricity-bill.png",
  "grasshopper.png",
  "repair.png",
  "planting.png"
];

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Hero(
          tag: "pop",
          child: Material(
            color: Colors.transparent,
            child: IconButton(
                icon: Icon(
                  EvaIcons.arrowBack,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Hero(
              tag: "search",
              child: Material(
                color: Colors.transparent,
                child: Icon(
                  EvaIcons.search,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
        elevation: 0.0,
        title: Hero(
            tag: "category",
            child: Material(
              color: Colors.transparent,
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontFamily: "Josefin",
                ),
              ),
            )),
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: category.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      SlideUpRoute(
                          page: ServicesList(
                        index: index,
                      )));
                },
                child: Hero(
                  tag: index.toString(),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 10.0, top: 10.0),
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0xFF3a7bd5).withOpacity(0.2),
                              offset: Offset(0, 10))
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                        color: ThemeColors.color[index]),
                    child: Material(
                        color: Colors.transparent,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 30.0,
                            ),
                            Image.asset(
                              "assets/icons/${categoryIcon[index]}",
                              width: 50.0,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              category[index],
                              style: TextStyle(
                                  fontFamily: "Quicksand",
                                  fontSize: 20.0,
                                  color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                ),
              );
            }),
      ),
    );
  }
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
          transitionDuration: Duration(milliseconds: 700),
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
