import 'package:ibanez_app/model/artist.dart';
import 'package:ibanez_app/model/database.dart';
import 'package:ibanez_app/model/guitar.dart';

Guitar getProductByID(int guitarID) {
  return productList[guitarID];
}

Artist getArtistByID(int artistId) {
  return artistList[artistId];
}

List<int> getArtistGuitars(int artistId) {
  return artistList[artistId].guitarIndex;
}