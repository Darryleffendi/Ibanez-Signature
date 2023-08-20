import 'package:ibanez_app/model/review.dart';

class Guitar {

  String name;
  String neckMat;
  String bodyMat;
  String fretboardMat;
  int fretAmount;
  String? artist;
  String pickup;
  double price;
  String description;
  String pickupDescription;
  String image;
  String bodyImage;
  String pickupImage;
  String colorScheme;
  List<Review> reviewList = [];

  Guitar({
    required this.name,
    required this.neckMat,
    required this.bodyMat,
    required this.fretboardMat,
    required this.fretAmount,
    required this.pickup,
    required this.price,
    required this.description,
    required this.pickupDescription,
    required this.image,
    required this.bodyImage,
    required this.pickupImage,
    required this.colorScheme,
  });

  Guitar.signature({
    required this.name,
    required this.neckMat,
    required this.bodyMat,
    required this.fretboardMat,
    required this.fretAmount,
    required this.artist,
    required this.pickup,
    required this.price,
    required this.description,
    required this.pickupDescription,
    required this.image,
    required this.bodyImage,
    required this.pickupImage,
    required this.colorScheme,
  });
}
