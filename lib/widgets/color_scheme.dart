import 'package:flutter/material.dart';

Map<String, LinearGradient> colorScheme = {
  "gold" : const LinearGradient(
    colors: [
      Color.fromARGB(255, 238, 165, 92),
      Color.fromARGB(221, 245, 205, 95),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
  "purple" : const LinearGradient(
    colors: [
      Color.fromARGB(255, 136,108,146),
      Color.fromARGB(221, 121,142,146),
    ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
  ),
  "green" : const LinearGradient(
    colors: [
      Color.fromARGB(255, 118, 194, 144),
      Color.fromARGB(221, 123, 139, 116),
    ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
  ),
  "grey" : const LinearGradient(
    colors: [
      Color.fromARGB(255, 184, 186, 190),
      Color.fromARGB(221, 106, 107, 108),
    ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
  ),
};


Map<String, Color> colorSolid = {
  "gold" : const Color.fromARGB(221, 245, 205, 95),
  "purple" : const Color.fromARGB(255, 136,108,146),
  "green" : const Color.fromARGB(255, 118, 194, 144),
  "grey" : const  Color.fromARGB(221, 106, 107, 108),
};