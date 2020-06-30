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
//      return GridView.count(
//        crossAxisCount: 3,
//        children: List.generate(images.length, (index) {
//          Asset asset = images[index];
//          return AssetThumb(
//            asset: asset,
//            width: 300,
//            height: 300,
//          );
//        }),
//      );
      return ListView.builder(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext ctxt, int index) {
              Asset asset = images[index];
              return AssetThumb(
                asset: asset,
                width: 150,
                height: 150,
              );
//              return Container(
//                height: 100,
//                width: 100,
//                padding: EdgeInsets.all(20.0),
//                color: Colors.green,
//              );
            });
    else
      return Container(
        height: 150,
        width: 150,
        color: Colors.green,
      );
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
        ),
        GestureDetector(
          onTap: loadAssets,
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    colors: ThemeColors.gradient2,
                    end: Alignment.bottomRight,
                    begin: Alignment.topLeft)),
            child: Center(
              child: Icon(
                EvaIcons.image,
                size: 30.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
