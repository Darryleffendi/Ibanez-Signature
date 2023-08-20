import 'package:flutter/material.dart';
import 'package:ibanez_app/pages/login_page.dart';

class Splash extends StatefulWidget {
  
  Function(bool) changeTheme;
  Splash({super.key, required this.changeTheme});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  double height = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height.toDouble();
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async {

    await Future.delayed(const Duration(milliseconds: 950), () {
      setState(() {
        height = height / 3 * 2;
        _isVisible = false;
      });
    });
    await Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginPage(changeTheme: widget.changeTheme,);
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutQuad,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutQuad,
          height: height,
          child: Center(
            child: Image.asset(
              "logo.png", 
              height: 40,
              fit: BoxFit.fitWidth,
            ),
          )
        ),
      ),
    );
  }
}