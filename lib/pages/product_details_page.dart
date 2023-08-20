import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ibanez_app/model/guitar.dart';
import 'package:ibanez_app/model/repository.dart';
import 'package:ibanez_app/model/review.dart';
import 'dart:math' as math;

import 'package:ibanez_app/widgets/color_scheme.dart';
import 'package:ibanez_app/widgets/custom_button.dart';
import 'package:ibanez_app/widgets/review_card.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ProductDetailsPage extends StatefulWidget {

  int productId;
  String username;

  ProductDetailsPage({super.key, required this.productId, required this.username});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  
  late Guitar guitar;
  late List<String> galleryList;
  
  String? reviewError;
  TextEditingController reviewController = TextEditingController();


  int rating = 0;
  
  void setRating(int r) {
    
    if(r == rating) {
      setState(() {
        rating = 0;
      });
      return;
    }

    setState(() {
      rating = r;
    });
  }
  
  void submitReview() {
    String review= reviewController.text;

    // Review validation
    if(review.isEmpty) {
      setState(() {
        reviewError = "Please fill in your review";
      });
      SnackBar snackBar = const SnackBar(
        content: Text("Review cannot be empty"),
        duration: Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
    }
    else {
      setState(() {
        reviewError = null;
      });
    }

    if(rating == 0) {
      setState(() {
        reviewError = "Please choose your rating";
      });
      SnackBar snackBar = const SnackBar(
        content: Text("Rating cannot be empty"),
        duration: Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    else {
      setState(() {
        reviewError = null;
      });
    }

    setState(() {
      guitar.reviewList.add(Review(username: widget.username, review: review, rating: rating));
    });
  }

  @override
  void initState() {
    super.initState();
    
    guitar = getProductByID(widget.productId);
    galleryList = [
      guitar.bodyImage,
      guitar.pickupImage,
    ];
  }

  @override
  Widget build(BuildContext context) {

    LinearGradient bgGradient = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment(0,0.2),
      colors: [
        Color.fromARGB(255, 13,53,80),
        Color.fromARGB(255, 4, 19, 30),
      ],
    );

    if(Theme.of(context).colorScheme != ColorScheme.dark()) {
      bgGradient = const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment(0,0.2),
        colors: [
          Color.fromARGB(255, 13,53,80),
          Color.fromARGB(255, 158, 197, 225),
        ],
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: bgGradient
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 200,
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left:15,
                          top: 15,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_outlined),
                            iconSize: 30,
                            color: const Color.fromARGB(100, 255, 255, 255),
                          ) 
                        ),
                        Positioned(
                          left: 0,
                          bottom: 10,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Opacity(
                              opacity: 0.5,
                              child: Text(
                                guitar.name.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 124,
                                  letterSpacing: -2.2,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white10,
                                    fontFamily: 'Modica',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 300,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(135/360),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: colorScheme[guitar.colorScheme],
                                borderRadius: BorderRadius.circular(80)
                              ),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.height,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          bottom: 10,
                          child: Center(
                            child: SimpleShadow(
                              color: Colors.black,
                              offset: const Offset(3, 3),
                              sigma: 7, 
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Image.asset(
                                  "assets/products/${guitar.image}",
                                  height: 290,
                                  fit: BoxFit.fitHeight,
                                )
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
      
                  Padding(
                    padding: const EdgeInsets.all(35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/logo.png", 
                              color: Colors.white,
                              height: 14,
                              fit: BoxFit.fitHeight,
                            ),
                            Text(
                            guitar.name,
                              style: const TextStyle(
                                fontFamily: 'Modica',
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            if(guitar.artist != null)
                              Text(
                                "${guitar.artist} signature",
                                style: const TextStyle(
                                  color: Color.fromARGB(139, 255, 255, 255),
                                  fontFamily: 'Modica',
                                  fontSize: 12,
                                ),
                              ),
                          ]
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [ 
                            const Text(
                              "PRICE",
                              style: TextStyle(
                                color: Color.fromARGB(139, 255, 255, 255),
                                fontFamily: 'Modica',
                                fontSize: 12,
                              ),
                            ),
                            Text(
                            "\$${guitar.price}",
                              style: TextStyle(
                                fontFamily: 'Modica',
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: colorSolid[guitar.colorScheme],
                              ),
                            ),
                          ]
                        )
                      ],
                    ),
                  ),

                  TabBar(
                    indicatorColor: colorSolid[guitar.colorScheme],
                    tabs: const [
                      Tab(
                        child: Text(
                          "Details",
                          style: TextStyle(
                            fontFamily: 'Modica',
                            letterSpacing: 3,
                          ),
                        )
                      ),
                      Tab(
                        child: Text(
                          "Reviews",
                          style: TextStyle(
                            fontFamily: 'Modica',
                            letterSpacing: 3,
                          ),
                        ),
                      )
                    ]
                  ),
                  
          
                  Container(
                    height: MediaQuery.of(context).size.height + 150,
                    child: TabBarView(
                      children: [

                        /* ======= Details ======= */
                        Padding(
                          padding: const EdgeInsets.all(35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  height: 45,
                                ),
                              const Text(
                                "DESCRIPTION",
                                style: TextStyle(
                                  fontFamily: 'Modica',
                                  fontSize: 20,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.white12,
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "${guitar.description} ${guitar.pickupDescription}",
                                style: TextStyle(
                                  fontFamily: 'Modica',
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 12,
                                  letterSpacing: 3,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 65,
                              ),
                              const Text(
                                "SPECS",
                                style: TextStyle(
                                  fontFamily: 'Modica',
                                  fontSize: 20,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.white12,
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "NECK",
                                    style: TextStyle(
                                      fontFamily: 'Modica',
                                      fontSize: 12,
                                      letterSpacing: 3,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    guitar.neckMat,
                                    style: TextStyle(
                                      fontFamily: 'Modica',
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 12,
                                      letterSpacing: 3,
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "BODY",
                                    style: TextStyle(
                                      fontFamily: 'Modica',
                                      fontSize: 12,
                                      letterSpacing: 3,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    guitar.bodyMat,
                                    style: TextStyle(
                                      fontFamily: 'Modica',
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 12,
                                      letterSpacing: 3,
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "FRETBOARD",
                                    style: TextStyle(
                                      fontFamily: 'Modica',
                                      fontSize: 12,
                                      letterSpacing: 3,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    guitar.fretboardMat,
                                    style: TextStyle(
                                      fontFamily: 'Modica',
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 12,
                                      letterSpacing: 3,
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "FRETS",
                                    style: TextStyle(
                                      fontFamily: 'Modica',
                                      fontSize: 12,
                                      letterSpacing: 3,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    guitar.fretAmount.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Modica',
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 12,
                                      letterSpacing: 3,
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "PICKUP",
                                    style: TextStyle(
                                      fontFamily: 'Modica',
                                      fontSize: 12,
                                      letterSpacing: 3,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    guitar.pickup,
                                    style: TextStyle(
                                      fontFamily: 'Modica',
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 12,
                                      letterSpacing: 3,
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),

                              const SizedBox(
                                height: 65,
                              ),
                              const Text(
                                "GALLERY",
                                style: TextStyle(
                                  fontFamily: 'Modica',
                                  fontSize: 20,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.white12,
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              NotificationListener<ScrollNotification>(
                                onNotification: (notification) => true,
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: 220,
                                    enableInfiniteScroll: true,
                                    padEnds : false,
                                    autoPlay: true,
                                    autoPlayInterval: const Duration(seconds: 3),
                                  ),
                                  items: galleryList.map((e) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                          child: Image.asset(
                                            "products/$e",
                                          ),
                                        );
                                      }
                                    );
                                  }) .toList()
                                ),
                              ),
                            ],
                          ),
                        ),

                        /* ======= Reviews ======= */
                        Padding(
                          padding: const EdgeInsets.all(35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: reviewController,
                                decoration: InputDecoration(
                                  hintText: "Write your review",
                                  labelText: "Write your review",
                                  errorText: reviewError,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  )
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Row(
                                      children: [
                                      IconButton(
                                        onPressed: () => setRating(1), 
                                        icon: rating >= 1 ? const Icon(Icons.star) : const Icon(Icons.star_border),
                                        color: Colors.white38,
                                        padding: EdgeInsets.zero,
                                      ),
                                      IconButton(
                                        onPressed: () => setRating(2), 
                                        icon: rating >= 2 ? const Icon(Icons.star) : const Icon(Icons.star_border),
                                        color: Colors.white38,
                                        padding: EdgeInsets.zero,
                                      ),
                                      IconButton(
                                        onPressed: () => setRating(3), 
                                        icon: rating >= 3 ? const Icon(Icons.star) : const Icon(Icons.star_border),
                                        color: Colors.white38,
                                        padding: EdgeInsets.zero,
                                      ),
                                      IconButton(
                                        onPressed: () => setRating(4), 
                                        icon: rating >= 4 ? const Icon(Icons.star) : const Icon(Icons.star_border),
                                        color: Colors.white38,
                                        padding: EdgeInsets.zero,
                                      ),
                                      IconButton(
                                        onPressed: () => setRating(5), 
                                        icon: rating >= 5 ? const Icon(Icons.star) : const Icon(Icons.star_border),
                                        color: Colors.white38,
                                        padding: EdgeInsets.zero,
                                      ),
                                    ]),
                                  ),

                                  Expanded(
                                    flex: 3,
                                    child: customButton("SUBMIT", colorSolid[guitar.colorScheme]!, () => submitReview()),
                                  )
                                ],
                              ),

                              const SizedBox(
                                height: 65,
                              ),
                              
                              const Text(
                                "REVIEWS",
                                style: TextStyle(
                                  fontFamily: 'Modica',
                                  fontSize: 20,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.white12,
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              Column(children: [
                                for (int i = 0; i < guitar.reviewList.length && i < 6; i ++)
                                  reviewCard(guitar.reviewList.reversed.toList()[i])
                              ]),
                            ]
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}