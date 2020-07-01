import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';
import 'package:proto/anims/page_route.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/screens/addressPage.dart';
import 'package:video_player/video_player.dart';

import 'imgPicker.dart';

class PostWork extends StatefulWidget {
  @override
  _PostWorkState createState() => _PostWorkState();
}

class _PostWorkState extends State<PostWork> {
  List<File> _imgs;
  bool isVideo = false;
  VideoPlayerController _controller;
  VoidCallback listener;
  bool initialized = false;

  _onImageButtonPressed(ImageSource source, {bool singleImage = false}) async {
    var imgs;
    if (!isVideo) {
      imgs = await MultiMediaPicker.pickImages(
          source: source, singleImage: singleImage);
    }
    setState(() {
      if (_controller != null) {
        _controller.setVolume(0.0);
        _controller.removeListener(listener);
      }
      if (isVideo) {
        MultiMediaPicker.pickVideo(source: source).then((File file) {
          if (file != null && mounted) {
            setState(() {
              _controller = VideoPlayerController.file(file)
                ..addListener(listener)
                ..setVolume(1.0)
                ..initialize()
                ..setLooping(true)
                ..play();
            });
          }
        });
      } else {
        _imgs = imgs;
      }
    });
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.removeListener(listener);
    }
    super.deactivate();
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  Widget _previewVideo(VideoPlayerController controller) {
    if (controller == null) {
      return Container(
        width: MediaQuery.of(context).size.width - 100,
        height: 100,
        child: Center(
          child: Column(
            children: <Widget>[
              Icon(
                EvaIcons.video,
                size: 40.0,
              ),
              const Text(
                'You have not yet picked a video',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    } else if (controller.value.initialized) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: AspectRatioVideo(controller),
      );
    } else {
      return const Text(
        'Error Loading Video',
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Post Work",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          physics: BouncingScrollPhysics(),
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text(
            //   "Post Work",
            //   textAlign: TextAlign.left,
            //   style: TextStyle(fontFamily: "Josefin", fontSize: 30.0),
            // ),
            SizedBox(
              height: 30.0,
            ),
            ImgPicker(),
            SizedBox(
              height: 30.0,
            ),
            _previewVideo(_controller),
            GestureDetector(
              onTap: () {
                isVideo = true;
                _onImageButtonPressed(ImageSource.gallery);
              },
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
                        "Pick Video",
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
            SizedBox(
              height: 20.0,
            ),
            TextField(
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "Josefin",
              ),
              decoration: InputDecoration(
                hintText: "Enter Title",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1165C1), width: 2.0),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextField(
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "Josefin",
              ),
              decoration: InputDecoration(
                hintText: "Enter Description",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1165C1), width: 2.0),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Hero(
                tag: "nextButton",
                child: Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                      // color: Color(0xFF1165C1),
                      gradient: LinearGradient(
                          colors: [Color(0xFF396afc), Color(0xFF2948ff)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(57, 106, 252, 0.3),
                            blurRadius: 10.0,
                            offset: Offset(3, 7.0))
                      ],
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                        icon: Icon(
                          EvaIcons.arrowCircleRight,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context, SlideUpRoute(page: Address()));
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AspectRatioVideo extends StatefulWidget {
  final VideoPlayerController controller;

  AspectRatioVideo(this.controller);

  @override
  AspectRatioVideoState createState() => new AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController get controller => widget.controller;
  bool initialized = false;

  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      if (!mounted) {
        return;
      }
      if (initialized != controller.value.initialized) {
        initialized = controller.value.initialized;
        setState(() {});
      }
    };
    controller.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      final Size size = controller.value.size;
      return new Center(
        child: new AspectRatio(
          aspectRatio: size.width / size.height,
          child: new VideoPlayer(controller),
        ),
      );
    } else {
      return new Container();
    }
  }
}
