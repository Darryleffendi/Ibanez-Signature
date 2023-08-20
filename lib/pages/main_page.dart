
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ibanez_app/pages/account_page.dart';
import 'package:ibanez_app/pages/home_page.dart';
import 'package:ibanez_app/pages/login_page.dart';
import 'package:ibanez_app/pages/product_page.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MainPage extends StatefulWidget {
  
  String username;
  Function(bool) changeTheme;

  MainPage({super.key, required this.username, required this.changeTheme});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentPage = 0;

  List<Widget> pages = [
    HomePage(username : "Name"),
    ProductPage(username : "Name"),
    AccountPage(username : "Name", logOut: () {}, changeTheme: (bool x) {})
  ];

  double navOpacity = 0.0;

  void toggleNavbar(bool x) {
    if(x) {
      setState(() {
        navOpacity = 1.0;
      });
      return;
    }

    setState(() {
      navOpacity = 0.0;
    });
  }

  void changePage(int pageIndex) {
    setState(() {
      currentPage = pageIndex;
    });
  }

  void logOut() {
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return LoginPage(changeTheme: widget.changeTheme);
    }), 
    (route) => false);
  }

  @override
  void initState() {
    super.initState();
    pages[0] = HomePage(username : widget.username);
    pages[1] = ProductPage(username : widget.username);
    pages[2] = AccountPage(username : widget.username, logOut: () => logOut(), changeTheme: widget.changeTheme,);
  }

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      centerTitle: true,
        elevation: 0,
        title: Image.asset("assets/logo.png",
          height: 25,
          fit: BoxFit.fitWidth,
          color: Theme.of(context).primaryColor,
        )
    );
    
    double navHeight = appBar.preferredSize.height;

    if(!kIsWeb) {
      navHeight = navHeight * 1.3;
    }

    LinearGradient bgGradient = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment(0,0.2),
      colors: [
        Color.fromARGB(255, 13,53,80),
        Color.fromARGB(255, 4, 19, 30),
      ],
    );

    Color navbarColor = const Color.fromARGB(255, 19, 36, 48);

    if(Theme.of(context).colorScheme != ColorScheme.dark()) {
      bgGradient = const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment(0,0.2),
        colors: [
          Color.fromARGB(255, 192, 219, 239),
          Color.fromARGB(255, 89, 127, 152),
        ],
      );

      navbarColor = const Color.fromARGB(255, 106, 134, 154);
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: NotificationListener<ScrollUpdateNotification>(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              gradient: bgGradient,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: pages[currentPage]
          ),
          AnimatedOpacity(
              opacity: navOpacity, 
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOutQuad,
              child: GlassmorphicContainer(
                height: navHeight,
                width: MediaQuery.of(context).size.width,
                linearGradient: LinearGradient(
                  colors: [
                    Colors.black87.withOpacity(0.2),
                    Colors.grey.shade800.withOpacity(0.2)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
                borderGradient: LinearGradient(colors: [
                  Colors.black87.withOpacity(0.2),
                  Colors.grey.shade800.withOpacity(0.2)
                ]),
                border: 0,
                borderRadius:0,
                blur: 15,
              )
            ),
        ]),
        onNotification: (notification) {
          if(notification.metrics.pixels > 0) {
            toggleNavbar(true);
          }
          else {
            toggleNavbar(false);
          }
          return true;
        },
      ),
       bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          toggleNavbar(false);
          changePage(value);
        },
        backgroundColor: navbarColor,
        selectedItemColor: Color.fromARGB(255, 203, 251, 255),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPage,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          const BottomNavigationBarItem(
            tooltip: "Home",
            label: "Home",
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home)
          ),
          const BottomNavigationBarItem(
            tooltip: "Shop",
            label: "Shop",
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag)
          ),
          BottomNavigationBarItem(
            tooltip: widget.username,
            label: widget.username,
            icon: const Icon(Icons.account_circle_outlined),
            activeIcon: const Icon(Icons.account_circle)
          ),
        ]
      ),
    );
  }
}