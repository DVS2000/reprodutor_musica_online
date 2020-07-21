import 'dart:ui';

import 'package:flutter/material.dart';

class ViewPhoto extends StatelessWidget {
  String img;

  ViewPhoto({this.img});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            img,
            fit: BoxFit.cover, 
            height: size.height,
            width: size.width
          ),

          BackdropFilter(
            filter: ImageFilter.blur(
                    sigmaX: 3, sigmaY: 3
                 ),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    color: Colors.black.withOpacity(.5)
                  ),
                ),
          ),

          Center(
              child: Hero(
                tag: img,
                child: Container(
                  height: size.height / 1.2,
                  width: size.width / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: AssetImage(img),
                          fit: BoxFit.cover)),
                ),
              ),
            )
        ],
      ),
    );
  }
}
