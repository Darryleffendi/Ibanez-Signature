import 'package:flutter/material.dart';
import 'package:ibanez_app/model/news.dart';
import 'package:ibanez_app/model/repository.dart';

TextButton newsCard(News news, double height) {

  return TextButton(
    onPressed: (() {}),
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero
    ),
    child: Stack(
      children: [
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            "assets/news/${news.image}",
            height: height,
            fit: BoxFit.fitHeight,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                news.subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: 'Modica',
                ),
              ),
              Text(
                news.title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 38,
                  letterSpacing: -2.2,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                    fontFamily: 'Modica',
                ),
              ),
              
              const SizedBox(
                height: 50,
              ),

              OutlinedButton(
                onPressed: (() => news.nextPage),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    width: 1.0, 
                    color: Color.fromARGB(255, 255, 255, 255)
                  ),
                  padding: const EdgeInsets.fromLTRB(35, 15, 35, 15)
                ),
                child: Text(
                  news.buttonText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                      fontFamily: 'Modica',
                  ),
                ),
              ),
            ]
          ),
        ),
      ],
    )
  );
}