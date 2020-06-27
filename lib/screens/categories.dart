import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/screens/homePart.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

List<String> category = ["Handyman", "Cleaning", "Electrical", "Pest Control"];

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              EvaIcons.arrowBack,
              color: Colors.black,
            ),
            onPressed: () {}),
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
            itemCount: category.length,
            itemBuilder: (BuildContext context, int index) {
              return Hero(
                tag: index.toString(),
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  height: 100,
                  width: 200,
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
                              fontSize: 20.0,
                              color: Colors.white),
                        )),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
