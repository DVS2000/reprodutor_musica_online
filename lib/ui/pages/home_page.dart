import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testano/data/model/album_model.dart';
import 'package:testano/ui/pages/video_page.dart';
import 'package:testano/ui/pages/view_photo.dart';
import 'package:testano/ui/widgets/positionSeekWidget.dart';
import 'package:testano/ui/widgets/shared_widget.dart';
import 'package:testano/utils/constantes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  int indexAlbum = -1;
  int indexTend = -1;

  bool status = false, statusPlay = false, initializeMusic = false;

  final audioController = AssetsAudioPlayer();
  Audio currentAudio = Audio("assets/music.mp3");
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset(
      "assets/video.mp4",
    )..initialize().then((_) {
        setState(() {});
      });

    _videoPlayerController.addListener(() {
      setState(() {
        _videoPlayerController.value.isPlaying
            ? statusPlay = true
            : statusPlay = false;
      });

      if (_videoPlayerController.value.isPlaying) {
        audioController.pause();
      }
    });

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
        body: Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: size.height,
                      width: size.width / 6,
                      decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(.2),
                          image: DecorationImage(
                              image: AssetImage(BACKGROUND_IMAGE),
                              fit: BoxFit.cover)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          color: Colors.black.withOpacity(.5),
                          child: ListView(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 30),
                                child: Text(
                                  "Alfe-Musik".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: FONT_BOLD,
                                      fontSize: 35),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 30),
                                child: Text(
                                  "EXPLORAR",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.7),
                                      fontFamily: FONT_BOLD,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              SharedWidget.itemMenu(
                                  text: "Destaque",
                                  icon: Icons.star,
                                  isActive: index == 0 ? true : false,
                                  onPressed: () => setState(() => index = 0)),
                              SharedWidget.itemMenu(
                                  text: "Radio",
                                  icon: Icons.radio,
                                  isActive: index == 1 ? true : false,
                                  onPressed: () => setState(() => index = 1)),
                              SharedWidget.itemMenu(
                                  text: "Lista de Múscia",
                                  icon: Icons.queue_music,
                                  isActive: index == 2 ? true : false,
                                  onPressed: () => setState(() => index = 2)),
                              SharedWidget.itemMenu(
                                  text: "Meus de Múscia",
                                  icon: Icons.library_music,
                                  isActive: index == 3 ? true : false,
                                  onPressed: () => setState(() => index = 3)),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 30),
                                child: Text(
                                  "MÚSICA",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.7),
                                      fontFamily: FONT_BOLD,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              SharedWidget.itemMenu(
                                  text: "Favoritos",
                                  icon: Icons.favorite,
                                  isActive: index == 4 ? true : false,
                                  onPressed: () => setState(() => index = 4)),
                              SharedWidget.itemMenu(
                                  text: "Local",
                                  icon: Icons.sd_storage,
                                  isActive: index == 5 ? true : false,
                                  onPressed: () => setState(() => index = 5)),
                              SharedWidget.itemMenu(
                                  text: "Baixadas",
                                  icon: Icons.storage,
                                  isActive: index == 6 ? true : false,
                                  onPressed: () => setState(() => index = 6)),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 30),
                                child: Text(
                                  "SUAS LISTA",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.7),
                                      fontFamily: FONT_BOLD,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              SharedWidget.itemMenu(
                                text: "Mobbers - Lockdown (Ep 2020)",
                                icon: Icons.album,
                              ),
                              SharedWidget.itemMenu(
                                  text: "H Baby - Quarentena Rija",
                                  icon: Icons.album),
                              SharedWidget.itemMenu(
                                  text: "Migos - Culture II (2018)",
                                  icon: Icons.album),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Color(0xffF7F7F7),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 10, bottom: 10),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 13.0),
                                        child: Text(
                                          "EXPLORAR",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: FONT_BOLD,
                                              fontSize: 25),
                                        ),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        icon: Icon(CupertinoIcons.left_chevron,
                                            color: Colors.grey),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: Icon(CupertinoIcons.right_chevron,
                                            color: Colors.grey),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: albums
                                            .map(
                                              (e) => SharedWidget.cardAlbum(
                                                  size: size,
                                                  model: e,
                                                  context: context,
                                                  isHoving: indexAlbum ==
                                                          albums.indexOf(e)
                                                      ? true
                                                      : false,
                                                  onHover: (status) {
                                                    setState(() {
                                                      status
                                                          ? indexAlbum =
                                                              albums.indexOf(e)
                                                          : indexAlbum = -1;
                                                    });
                                                  }),
                                            )
                                            .toList()),
                                  )
                                ],
                              )),
                             
                              Expanded(
                                  child: Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, top: 0),
                                            child: Text(
                                              "TENDÊNCIAS",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: FONT_BOLD,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListView(
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 10, right: 10),
                                              children: albums
                                                  .map((e) => InkWell(
                                                        onTap: () => Navigator
                                                                .of(context)
                                                            .push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ViewPhoto(
                                                                              img: e.img,
                                                                            ))),
                                                        onHover: (v) {
                                                          setState(() {
                                                            v
                                                                ? indexTend =
                                                                    albums
                                                                        .indexOf(
                                                                            e)
                                                                : indexTend =
                                                                    -1;
                                                          });
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  200),
                                                          height: 100,
                                                          width:
                                                              double.infinity,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 15),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Color(
                                                                      0xffF7F7F7),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  boxShadow: indexTend ==
                                                                          albums
                                                                              .indexOf(e)
                                                                      ? [
                                                                          BoxShadow(
                                                                              color: Colors.black.withOpacity(.2),
                                                                              blurRadius: 10,
                                                                              offset: Offset(0.0, 5.0))
                                                                        ]
                                                                      : null),
                                                          child: Row(
                                                            children: [
                                                              Hero(
                                                                tag: e.img,
                                                                child: Container(
                                                                    margin: EdgeInsets
                                                                        .all(
                                                                            10),
                                                                    width: 90,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                4),
                                                                        image: DecorationImage(
                                                                            image:
                                                                                AssetImage(e.img),
                                                                            fit: BoxFit.cover))),
                                                              ),
                                                              Text(
                                                                e.cantor,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        FONT_BOLD,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              Spacer(),
                                                              Text(
                                                                e.nome,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        FONT_BOLD,
                                                                    fontSize:
                                                                        17,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              Spacer(),
                                                              Text(
                                                                "${e.cantor.toLowerCase().contains("baby") ? '02:43' : (albums.indexOf(e) + 1).toString() + ':40'}",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        FONT_BOLD,
                                                                    fontSize:
                                                                        17,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              Spacer(),
                                                              Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(4),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            15),
                                                                decoration: BoxDecoration(
                                                                    color: PRIMARY_COLOR
                                                                        .withOpacity(
                                                                            .3),
                                                                    shape: BoxShape
                                                                        .circle),
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(4),
                                                                  decoration: BoxDecoration(
                                                                      color: PRIMARY_COLOR
                                                                          .withOpacity(
                                                                              .6),
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(3),
                                                                    decoration: BoxDecoration(
                                                                        color:
                                                                            PRIMARY_COLOR,
                                                                        shape: BoxShape
                                                                            .circle),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Icon(
                                                                        e.cantor.toLowerCase().contains("baby")
                                                                            ? Icons.pause
                                                                            : Icons.play_arrow,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            25,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          )
                                        ],
                                      )),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 0),
                                        child: Text(
                                          "VIDEOS",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: FONT_BOLD,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ),
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 20,
                                                  top: 20,
                                                  right: 30,
                                                  bottom: 20),
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(.6),
                                                        blurRadius: 10,
                                                        offset:
                                                            Offset(0.0, 3.0))
                                                  ],
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          CAPA_MUSIC),
                                                      fit: BoxFit.cover)),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.black
                                                          .withOpacity(.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child:
                                                        !_videoPlayerController
                                                                .value
                                                                .initialized
                                                            ? Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor: AlwaysStoppedAnimation<
                                                                          Color>(
                                                                      Colors
                                                                          .white),
                                                                ),
                                                              )
                                                            : Stack(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        GestureDetector(
                                                                      onDoubleTap: () => Navigator.of(context).push(MaterialPageRoute(
                                                                          builder: (context) => VideoPage(
                                                                                controller: _videoPlayerController,
                                                                              ))),
                                                                      child: VideoPlayer(
                                                                          _videoPlayerController),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomLeft,
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () => _videoPlayerController
                                                                              .value
                                                                              .isPlaying
                                                                          ? _videoPlayerController
                                                                              .pause()
                                                                          : _videoPlayerController
                                                                              .play(),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            60,
                                                                        height:
                                                                            60,
                                                                        margin:
                                                                            EdgeInsets.all(20),
                                                                        padding:
                                                                            const EdgeInsets.all(6),
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.white.withOpacity(.3),
                                                                            shape: BoxShape.circle),
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              const EdgeInsets.all(6),
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white.withOpacity(.6),
                                                                              shape: BoxShape.circle),
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                const EdgeInsets.all(4),
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                                                            child:
                                                                                Center(
                                                                              child: Icon(
                                                                                statusPlay ? Icons.pause : Icons.play_arrow,
                                                                                color: PRIMARY_COLOR,
                                                                                size: 30,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomCenter,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          VideoProgressIndicator(
                                                                        _videoPlayerController,
                                                                        allowScrubbing:
                                                                            true,
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
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: size.height / 5.7,
                width: size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    StreamBuilder(
                      stream: audioController.realtimePlayingInfos,
                      builder: (context, snapshot) {
                        final RealtimePlayingInfos infos = snapshot.data;
                        if(!snapshot.hasData) {
                          return Slider(
                            value: 0,
                            min: 0,
                            max: 10,
                            activeColor: PRIMARY_COLOR.withOpacity(.5),
                            onChanged: (v) {},
                          );
                        } else {
                          return PositionSeekWidget(
                            currentPosition: infos.currentPosition,
                            duration: infos.duration,
                            seekTo: (to) {
                              audioController.seek(to);
                            },
                          );
                        }
                      }
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Row(
                          children: [
                            SharedWidget.cantorDetails(
                                size: size, context: context),
                            Spacer(),
                            SharedWidget.controlReprodutor(
                                controller: audioController,
                                onTap: () {
                                  if (initializeMusic) {
                                    audioController.playOrPause();
                                    _videoPlayerController.pause();
                                  } else {
                                    audioController.open(currentAudio,
                                        autoStart: true);

                                    _videoPlayerController.pause();

                                    initializeMusic = true;
                                  }
                                },
                                size: size
                              ),
                            Spacer(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
