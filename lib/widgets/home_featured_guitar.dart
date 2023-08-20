import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:simple_shadow/simple_shadow.dart';

Widget homeFeaturedGuitar(String imageUrl, bool isActive) {

  double opacity = 0;
  double opacityBg = 0;

  if(isActive) {
    opacity = 0.6;
    opacityBg = 1;
  }

  return Stack(
    children: [
      Opacity(
        opacity: opacityBg,
        child: RotatedBox(
          quarterTurns: 3,
          child: Image.asset(
            "assets/products/$imageUrl",
            height: 170,
            fit: BoxFit.fitHeight,
            color: const Color.fromARGB(221, 4,23,36),
          ),
        ),
      ),

      SimpleShadow(
        color: Colors.black,
        offset: const Offset(3, 3),
        sigma: 7, 
        child: Opacity(
          opacity: opacity,
          child: RotatedBox(
            quarterTurns: 3,
            child: Image.asset(
              "assets/products/$imageUrl",
              height: 170,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    ],
  );
}