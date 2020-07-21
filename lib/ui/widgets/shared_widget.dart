import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testano/data/model/album_model.dart';
import 'package:testano/ui/pages/view_photo.dart';
import 'package:testano/utils/constantes.dart';

class SharedWidget {
  static Widget progressBarMusic({Size size}) => /* PROGRESS BAR MUSIC */
      Container(
        height: 8,
        width: size.width,
        color: Color(0xffCACACA),
        child: Stack(
          children: [
            Container(
                width: size.width / 3,
                decoration: BoxDecoration(
                    color: PRIMARY_COLOR,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(30))))
          ],
        ),
      );

  static Widget cantorDetails({Size size, BuildContext context}) => Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (contex) => ViewPhoto(
                      img: CAPA_MUSIC,
                    ))),
            child: Hero(
              tag: CAPA_MUSIC,
              child: Container(
                width: size.width / 18,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(CAPA_MUSIC), fit: BoxFit.cover)),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "H Baby",
                style: TextStyle(
                    color: PRIMARY_COLOR, fontFamily: FONT_BOLD, fontSize: 25),
              ),
              Text(
                "Quarentena Rija",
                style: TextStyle(
                    color: Colors.grey, fontFamily: FONT_REGULAR, fontSize: 20),
              )
            ],
          ),
        ],
      );

  static Widget controlReprodutor(
          {Size size, AssetsAudioPlayer controller, Function onTap}) =>
      Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.skip_previous,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: () {
              print("PREVVVV");
            },
          ),
          PlayerBuilder.isPlaying(
              player: controller,
              builder: (context, isPlaying) {
              return GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOR.withOpacity(.3), shape: BoxShape.circle),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: PRIMARY_COLOR.withOpacity(.6),
                        shape: BoxShape.circle),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: PRIMARY_COLOR, shape: BoxShape.circle),
                      child: Center(
                          child: 
                                 Icon(
                                  isPlaying ? Icons.pause : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30,
                                )
                              ),
                    ),
                  ),
                ),
              );
            }
          ),
          IconButton(
            icon: Icon(
              Icons.skip_next,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: () {
              print("PREVVVV");
            },
          )
        ],
      );

  static Widget itemMenu(
          {String text,
          IconData icon,
          bool isActive = false,
          Function onPressed}) =>
      FlatButton(
        color: isActive ? Colors.grey.withOpacity(.8) : null,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: FONT_BOLD,
                    fontWeight: FontWeight.w100),
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      );

  static Widget cardAlbum(
          {Size size,
          AlbumModel model,
          BuildContext context,
          void onHover(bool v),
          bool isHoving = false}) =>
      Container(
        height: size.height / 4,
        width: size.width / 7.5,
        margin: const EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                onHover: onHover,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(.6),
                            blurRadius: 10,
                            offset: Offset(0.0, 3.0))
                      ],
                      image: DecorationImage(
                          image: AssetImage(model.img), fit: BoxFit.cover)),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 250),
                    opacity: isHoving ? 1.0 : 0.0,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: .4, sigmaY: .4),
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.all(80),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.3),
                                shape: BoxShape.circle),
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.6),
                                  shape: BoxShape.circle),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: PRIMARY_COLOR,
                                    //size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.cantor,
                  style: TextStyle(
                      //color: PRIMARY_COLOR,
                      fontFamily: FONT_BOLD,
                      fontSize: 25),
                ),
                Text(
                  model.nome,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: FONT_REGULAR,
                      fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
}
