import 'package:flutter/material.dart';
import 'package:ibanez_app/model/guitar.dart';
import 'package:ibanez_app/model/repository.dart';

TextButton guitarCard(int guitarIndex, Function onPressed) {

  Guitar guitar = getProductByID(guitarIndex);
  
  return TextButton(
    onPressed: (() => onPressed()),
    child: Column(children: [
      const SizedBox(
        height: 50,
      ),
      Image.asset("assets/products/${guitar.image}"),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(guitar.artist == null)
                const Text(
                  " ",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              else
                Text(
                  "${guitar.artist} signature",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Modica',
                  ),
                ),
              Text(
                guitar.name,
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                    fontFamily: 'Modica',
                ),
              ),
            ]
          ),
          Text(
            "\$${guitar.price}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color.fromARGB(140, 255, 255, 255),
                fontFamily: 'Modica',
            ),
          ),
        ],
      )
    ],)
  );
}