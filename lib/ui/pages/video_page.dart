import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testano/utils/constantes.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  VideoPlayerController controller;
  VideoPage({this.controller});
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool status = false;
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = widget.controller;

    _videoPlayerController.addListener(() {
      setState(() {
        _videoPlayerController.value.isPlaying ? status = true : status = false;
      });
    });

    _videoPlayerController.play();
    _videoPlayerController.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: _videoPlayerController.value.initialized
              ? Stack(
                  children: [
                    Image.asset(CAPA_MUSIC,
                        fit: BoxFit.cover,
                        height: size.height,
                        width: size.width),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: GestureDetector(),
                    ),
                    Container(
                      height: size.height,
                      width: size.width,
                      color: Colors.white.withOpacity(.1),
                      //aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: VideoPlayer(_videoPlayerController))),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: VideoProgressIndicator(
                                _videoPlayerController,
                                allowScrubbing: true,
                                colors: VideoProgressColors(
                                    backgroundColor:
                                        Colors.white.withOpacity(.5),
                                    bufferedColor: Colors.white.withOpacity(.8),
                                    playedColor: PRIMARY_COLOR),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    _videoPlayerController.value.initialized
                        ? GestureDetector(
                            onTap: () => _videoPlayerController.value.isPlaying
                                ? _videoPlayerController.pause()
                                : _videoPlayerController.play(),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    padding: const EdgeInsets.all(4),
                                    margin:
                                        EdgeInsets.only(right: 20, bottom: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(.3),
                                        shape: BoxShape.circle),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.6),
                                          shape: BoxShape.circle),
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Icon(
                                            status
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            color: PRIMARY_COLOR,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    _videoPlayerController.value.initialized
                        ? GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    padding: const EdgeInsets.all(4),
                                    margin: EdgeInsets.only(left: 20, top: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(.3),
                                        shape: BoxShape.circle),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.6),
                                          shape: BoxShape.circle),
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Icon(
                                            Icons.close,
                                            color: PRIMARY_COLOR,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                )
              : CircularProgressIndicator()),
    );
  }
}
