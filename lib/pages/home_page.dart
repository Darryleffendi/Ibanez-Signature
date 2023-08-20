import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ibanez_app/model/database.dart';
import 'package:ibanez_app/model/repository.dart';
import 'package:ibanez_app/pages/product_details_page.dart';
import 'package:ibanez_app/widgets/home_featured_card.dart';
import 'package:ibanez_app/widgets/home_featured_guitar.dart';
import 'package:ibanez_app/widgets/news_card.dart';

class HomePage extends StatefulWidget {
  
  String? username;

  HomePage({super.key, this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int sliderIndex = 0;
  int featuredIndex = 0;
  List<Map<String, dynamic>> featuredActive = [
    {
      "id" : 6,
      "active" : true,
    },
    {
      "id" : 0,
      "active" : false,
    },
    {
      "id" : 4,
      "active" : false,
    },
  ];

  void goToDetails(int productId) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) {
        return ProductDetailsPage(productId: productId, username: widget.username!);
      })
    );
  }

  void changeFeatured(int index) {
    if(index == featuredIndex) {
      goToDetails(featuredActive[index]["id"]);
      return;
    }

    setState(() {
      featuredActive[featuredIndex]["active"] = false;
      featuredActive[index]["active"] = true;
    });
    featuredIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    
    double headerHeight = MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack( children: [
            NotificationListener<ScrollNotification>(
              onNotification: (notification) => true,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: headerHeight,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      sliderIndex = index;
                    });
                  },
                ),
                items: newsList.map((e) {
                  return Builder(
                    builder: (BuildContext context) {
                      return newsCard(e, headerHeight);
                    }
                  );
                }) .toList()
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Column ( 
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DotsIndicator(
                    dotsCount: newsList.length,
                    position: sliderIndex,
                    decorator: const DotsDecorator(
                      activeColor: Color.fromARGB(210, 255, 255, 255),
                      color: Color.fromARGB(52, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  )
                ]
              ),
            )
          ]),

          Padding(
            padding: const EdgeInsets.all(45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "logo_alt.png",
                    height: 65,
                    fit: BoxFit.fitHeight,
                    color: Theme.of(context).primaryColor
                  ),
                ),

                const SizedBox(
                  height: 70,
                ),

                Text(
                  "Welcome, ${widget.username}".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 24,
                    letterSpacing: -1,
                    fontWeight: FontWeight.w700,
                      fontFamily: 'Modica',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Text(
                  "At Ibanez Signature, we revere traditional values and artistry. Each instrument embodies a creator's essence. Devotion to craft defines us, as it does you. Our guitars empower you to reshape music history. Onstage, wielding our creation, we share your pride as your music transforms. With Ibanez Signature, in your hands, anticipate revolutionary soundscapes. Join us in crafting musical magic that resonates worldwide.",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Theme.of(context).primaryColorDark,
                    fontFamily: 'Modica',
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),

                Text(
                  "EXPLORE OUR STORY >>",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: -1.5,
                    wordSpacing: 2,
                    height: 1.5,
                    color: Theme.of(context).primaryColorDark,
                    fontFamily: 'Modica',
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),
              ]
            ),
          ),

          const Divider(
            color: Colors.white30,
          ),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 70, 25, 25),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      "FEATURED GUITARS",
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: -1.5,
                        fontWeight: FontWeight.w700,
                          fontFamily: 'Modica',
                      ),
                      textAlign: TextAlign.left,
                    ),

                    const SizedBox(
                      height: 5,
                    ),
          
                    const Divider(
                      color: Colors.white24,
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    homeFeaturedCard("Joe Satriani JS2450", featuredActive[0]["active"], () => changeFeatured(0), context),
                    homeFeaturedCard("Steve Vai PIA371", featuredActive[1]["active"], () => changeFeatured(1), context),
                    homeFeaturedCard("Kiko Loureiro KIKOSP3", featuredActive[2]["active"], () => changeFeatured(2), context),
                  ],
                ),
                
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Stack(
                  alignment: Alignment.topCenter,
                    children: [
                      homeFeaturedGuitar(getProductByID(featuredActive[0]["id"]).image, featuredActive[0]["active"]),
                      homeFeaturedGuitar(getProductByID(featuredActive[1]["id"]).image, featuredActive[1]["active"]),
                      homeFeaturedGuitar(getProductByID(featuredActive[2]["id"]).image, featuredActive[2]["active"]),
                    ],
                  ),
                ),
              ],
            ),
          ),

          
          const SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
} 