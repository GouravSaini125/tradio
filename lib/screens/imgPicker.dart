import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:proto/configs/ThemeColors.dart';

class ImgPicker extends StatefulWidget {
  @override
  _ImgPickerState createState() => _ImgPickerState();
}

class _ImgPickerState extends State<ImgPicker> {
  List<Asset> images = List<Asset>();

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    if (images != null && images.length != 0)
      return ListView.builder(
          itemCount: images.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext ctxt, int index) {
            Asset asset = images[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AssetThumb(
                asset: asset,
                width: 150,
                height: 150,
              ),
            );
          });
    else
      return Container(
          child: Stack(
            children: <Widget>[
              Center(
                child: Image.asset(
                  "assets/images/flutter_logo.png",
                  height: 150,
                  width: 150,
                ),
              ),
              Center(
                child: Container(
                  color: Color.fromRGBO(0, 0, 255, 0.3),
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    "No Images Selected",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ));
  }

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });

    List<Asset> resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: true,
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error != null) print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: buildGridView(),
          height: 200.0,
          margin: EdgeInsets.only(bottom: 30.0),
        ),
        GestureDetector(
          onTap: loadAssets,
          child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    colors: ThemeColors.gradient2,
                    end: Alignment.bottomRight,
                    begin: Alignment.topLeft)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    EvaIcons.image,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Pick Images",
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
