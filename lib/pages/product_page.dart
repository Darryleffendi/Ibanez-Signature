import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ibanez_app/model/database.dart';
import 'package:ibanez_app/model/guitar.dart';
import 'package:ibanez_app/model/repository.dart';
import 'package:ibanez_app/pages/product_details_page.dart';
import 'package:ibanez_app/widgets/artist_card.dart';
import 'package:ibanez_app/widgets/featured_card.dart';
import 'package:ibanez_app/widgets/guitar_card.dart';

class ProductPage extends StatefulWidget {
  
  String username;

  ProductPage({super.key, required this.username});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  List<int> featuredIdList = [];
  int pickedArtistId = 0;

  void goToDetails(int productId) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) {
        return ProductDetailsPage(productId: productId, username: widget.username,);
      })
    );
  }

  void pickArtist(int artistId) {
    if(artistId == pickedArtistId) {
      return;
    }
    setState(() {
      pickedArtistId = artistId;
    });
  }

  @override
  void initState() {
    super.initState();
    
    for(int i = 0; i < 4; i ++) {
      int rand;
      do {
        rand = Random().nextInt(productList.length);
      }
      while(featuredIdList.contains(rand));

      featuredIdList.add(rand);
    }
  }

  @override
  Widget build(BuildContext context) {

    return
      SingleChildScrollView(
        child: Container(       
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const SizedBox(
              height: 155
            ),
            Text(
              "  FEATURED",
              style: TextStyle(
                fontFamily: 'Modica',
                color: Theme.of(context).primaryColorDark,
                fontSize: 12,
                letterSpacing: 5,
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              "  INSTRUMENTS",
              style: TextStyle(
                fontFamily: 'Modica',
                fontSize: 20,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 25,
            ),

            NotificationListener<ScrollNotification>(
              onNotification: (notification) => true,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  padEnds : false,
                ),
                items: featuredIdList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return featuredCard(i, (() => goToDetails(i)));
                    }
                  );
                }) .toList()
              ),
            ),

            const SizedBox(
              height: 50
            ),
            Text(
              "  FEATURED",
              style: TextStyle(
                fontFamily: 'Modica',
                color: Theme.of(context).primaryColorDark,
                fontSize: 12,
                letterSpacing: 5,
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              "  ARTISTS",
              style: TextStyle(
                fontFamily: 'Modica',
                fontSize: 20,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),

            NotificationListener<ScrollNotification>(
              onNotification: (notification) => true,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  padEnds : false,
                  viewportFraction: 0.6,  
                ),
                items: artistList.asMap().entries.map((a) {
                  return Builder(
                    builder: (BuildContext context) {
                      return artistCard(a.value, a.key, pickArtist);
                    }
                  );
                }) .toList()
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getArtistByID(pickedArtistId).group,
                    style: TextStyle(
                      fontFamily: 'Modica',
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 12,
                      letterSpacing: 5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    getArtistByID(pickedArtistId).name.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Modica',
                      fontSize: 20,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    getArtistByID(pickedArtistId).description,
                    style: TextStyle(
                      fontFamily: 'Modica',
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 12,
                      letterSpacing: 5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                for(int i = 0; i < getArtistGuitars(pickedArtistId).length; i ++) 
                  guitarCard(getArtistGuitars(pickedArtistId)[i], () => goToDetails(getArtistGuitars(pickedArtistId)[i]))
              ])
            ),


          ])
        ),
      );
  }
}