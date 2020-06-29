import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:proto/anims/page_route.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/screens/serviceDetails.dart';

class ServicesList extends StatefulWidget {
  // String catego/ry;
  int index;
  // Color color;
  ServicesList({Key key, @required this.index}) : super(key: key);
  @override
  _ServicesListState createState() => _ServicesListState();
}

List<String> category = [
  "Handyman",
  "Cleaning",
  "Electrical",
  "Pest Control",
  "Plumber"
];

List<String> categoryIcon = [
  "construction.png",
  "vacuum-cleaner.png",
  "electricity-bill.png",
  "grasshopper.png",
  "water-bill.png"
];

List<String> popularImages = [
  "carpentry.jpg",
  "cleaning.jpg",
  "electrical.jpg",
  "gardening.jpeg"
];

class _ServicesListState extends State<ServicesList> {
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                onPressed: () {}),
          ),
        ),
        title: Hero(
          tag: "category",
          child: Material(
            color: Colors.transparent,
            child: Text(
              "Services",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontFamily: "Josefin",
              ),
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              child: Hero(
                tag: widget.index.toString(),
                child: Container(
                  margin: EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 20.0, top: 10.0),
                  height: 70,
                  width: 200,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10.0,
                            color: Colors.black12,
                            offset: Offset(0, 7))
                      ],
                      borderRadius: BorderRadius.circular(15.0),
                      color: ThemeColors.color[widget.index]),
                  child: Material(
                    color: Colors.transparent,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30.0,
                        ),
                        Image.asset(
                          "assets/icons/${categoryIcon[widget.index]}",
                          width: 20.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          category[widget.index],
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              fontSize: 15.0,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              child: ListView.builder(
                  itemCount: 4,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, SlideUpRoute(page: Details(index: index)));
                      },
                      child: Hero(
                        tag: popularImages[index],
                        child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/${popularImages[index]}",
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15.0),
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
                                      bottom: 20.0, left: 10.0, right: 10.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                                              MainAxisAlignment.spaceBetween,
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
        ),
      ),
    );
  }
}
