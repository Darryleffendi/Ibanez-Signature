import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibanez_app/model/review.dart';

Widget reviewCard(Review rev) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Image.asset(
                  "user.png",
                  height: 30,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rev.username,
                    style: const TextStyle(
                      fontFamily: 'Modica',
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  rev.getRating(15),
                ]
              )
            ],
          ),
          Text(
            "${Random().nextInt(60)} minutes ago",
            style: const TextStyle(
              fontFamily: 'Modica',
              fontSize: 10,
              letterSpacing: 1,
              color: Colors.white38
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        rev.review,
        style: const TextStyle(
          fontFamily: 'Modica',
          fontSize: 12,
          letterSpacing: 1,
          color: Colors.white38
        ),
      ),
      const SizedBox(
        height: 30,
      ),
    ]
  );
}