import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ibanez_app/model/guitar.dart';
import 'package:ibanez_app/model/repository.dart';

import 'package:ibanez_app/widgets/color_scheme.dart';
import 'package:simple_shadow/simple_shadow.dart';

TextButton featuredCard(int guitarIndex, Function onPressed) {

  Guitar guitar = getProductByID(guitarIndex);
  
  return TextButton(
    onPressed: (() => onPressed()),
    child: Container(
      width: 280,
      height: 1000,
      decoration: BoxDecoration(
        gradient: colorScheme[guitar.colorScheme],
        borderRadius: const BorderRadius.all(Radius.circular(25))
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/logo.png", 
                  color: Colors.black,
                  height: 10,
                  fit: BoxFit.fitHeight,
                ),
                Text(
                guitar.name,
                  style: const TextStyle(
                    fontFamily: 'Modica',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                if(guitar.artist != null)
                  Text(
                    "${guitar.artist} signature",
                    style: const TextStyle(
                      color: Color.fromARGB(140, 0, 0, 0),
                      fontFamily: 'Modica',
                      fontSize: 10,
                    ),
                  ),
              ]
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SimpleShadow(
            color: Colors.black,
            offset: const Offset(3, 3),
            sigma: 7, 
            child: Opacity(
              opacity: 0.85,
              child: Image.asset(
                "assets/products/${guitar.image}",
                height: 160,
                alignment: Alignment.centerLeft,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      )
    ) 
  );
}