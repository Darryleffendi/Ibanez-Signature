import 'package:flutter/material.dart';
import 'package:ibanez_app/model/database.dart';
import 'package:ibanez_app/model/guitar.dart';
import 'package:ibanez_app/widgets/guitar_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(text: "Products",),
              Tab(text: "Artists",),
            ]),
            toolbarHeight: 0,
            backgroundColor: const Color.fromARGB(255, 24, 26, 26),
          ),
          body: TabBarView(children: [
            /* ====== Products ====== */
            
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  for(int i = 0; i < productList.length; i ++)
                    guitarCard(i, (() {}))
                  
                ])
              ),
            ),

            /* ====== Artists ====== */
            Text("Kontol"),
          ]),
        ),
      );
  }
}