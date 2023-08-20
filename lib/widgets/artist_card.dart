import 'package:flutter/material.dart';
import 'package:ibanez_app/model/guitar.dart';
import 'package:ibanez_app/model/repository.dart';
import 'package:ibanez_app/model/artist.dart';
import 'package:ibanez_app/widgets/color_scheme.dart';
import 'package:simple_shadow/simple_shadow.dart';

TextButton artistCard(Artist artist, int artistId, Function(int) onClick) {  
  return TextButton(
    onPressed: (() => onClick(artistId)),
    child: Container(
      width: 200,
      height: 400,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 240,
                width: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white12
                ),
              )
            ],
          ),

          

          SimpleShadow(
            color: Colors.black,
            offset: const Offset(3, 3),
            sigma: 7, 
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                "assets/artists/${artist.image}",
                height: 280,
                alignment: Alignment.center,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
              
              artist.name.toUpperCase(),
                style: const TextStyle(
                  fontFamily: 'Modica',
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  color: Colors.white10,
                ),
                textAlign: TextAlign.right,
              ),
            ]
          ),
        ],
      )
    ) 
  );
}