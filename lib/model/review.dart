import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Review {
  String username;
  String review;
  int rating;

  Review({required this.username, required this.review, required this.rating});

  Row getRating(double size) {
    List<Icon> starList = [];
    
    int i = 0;
    for(; i < rating; i ++) {
      starList.add(Icon(
        Icons.star, 
        size: size,
        color: Colors.white,
      ));
    }
    for(; i < 5; i ++) {
      starList.add(Icon(
        Icons.star_border, 
        size: size,
        color: Colors.white38
      ));
    }

    return Row(children: starList);
  }
}