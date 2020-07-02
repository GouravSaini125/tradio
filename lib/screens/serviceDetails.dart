import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/screens/postWork.dart';

import 'homePart.dart';
import 'instantBook.dart';

class Details extends StatefulWidget {
  int index;
  Details({Key key, @required this.index}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

List<String> popularImages = [
  "carpentry.jpg",
  "cleaning.jpg",
  "electrical.jpg",
  "gardening.jpeg"
];

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Hero(
              tag: popularImages[widget.index],
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "assets/images/${popularImages[widget.index]}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                left: 20.0,
                top: 40.0,
                child: IconButton(
                    icon: Icon(
                      EvaIcons.arrowBack,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })),
            DraggableScrollableSheet(
              initialChildSize: 0.5,
              maxChildSize: 0.8,
              minChildSize: 0.5,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                  ),
                  padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    children: <Widget>[
                      Text(
                        "Example Service",
                        style: TextStyle(fontFamily: "Josefin", fontSize: 30.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Example Category",
                        style: TextStyle(fontFamily: "Josefin", fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        "Details",
                        style: TextStyle(fontFamily: "Josefin", fontSize: 30.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Details description",
                        style: TextStyle(fontFamily: "Josefin", fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        "Price",
                        style: TextStyle(fontFamily: "Josefin", fontSize: 30.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "15\$",
                        style: TextStyle(fontFamily: "Josefin", fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        "Ratings",
                        style: TextStyle(fontFamily: "Josefin", fontSize: 30.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Ratings Details",
                        style: TextStyle(fontFamily: "Josefin", fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, SlideUpRoute(page: PostWork()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 100,
                          height: 60.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: ThemeColors.gradient2,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: Text(
                              "Book",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, SlideUpRoute(page: InstantBook()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 100,
                          height: 60.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: ThemeColors.gradient3,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: Text(
                              "Instant Book",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
