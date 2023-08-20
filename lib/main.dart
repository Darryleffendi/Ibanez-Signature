import 'package:flutter/material.dart';
import 'package:ibanez_app/pages/home_page.dart';
import 'package:ibanez_app/pages/main_page.dart';
import 'package:ibanez_app/pages/splash.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

bool darkmode = true;

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 17, 17, 17),
  colorScheme: const ColorScheme.dark(),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
  ),
  primaryColor: Colors.white,
  primaryColorDark: Colors.grey,
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 17, 17, 17),
  colorScheme: const ColorScheme.light(),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
  ),
  primaryColor: Colors.black,
  primaryColorDark: Colors.grey.shade900,
);

class _MyAppState extends State<MyApp> {

  void changeTheme(bool dark) {
    setState(() {
      darkmode = dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ibanez",
      theme: darkmode ? darkTheme : lightTheme,

      home: Splash(changeTheme: changeTheme),
      //home: MainPage(username: "Darryl", changeTheme: changeTheme,)
    );
  }
}