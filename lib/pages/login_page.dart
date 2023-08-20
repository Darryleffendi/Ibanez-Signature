import 'package:flutter/material.dart';
import 'package:ibanez_app/pages/main_page.dart';
import 'package:ibanez_app/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  Function(bool) changeTheme;

  LoginPage({super.key, required this.changeTheme});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? usernameError;
  String? passwordError;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<Map> subPages = [
    {
      "isVisible" : true,
      "opacity" : 1.0
    },
    {
      "isVisible" : false,
      "opacity" : 0.0
    }
  ];

  int pageIndex = 0;

  void changePage(int newIndex) async {

    setState(() {
      subPages[pageIndex]["opacity"] = 0.0;
    });

    await Future.delayed(const Duration(milliseconds: 220), () {
      setState(() {
        subPages[pageIndex]["isVisible"] = false;    
        subPages[newIndex]["isVisible"] = true;
        pageIndex = newIndex;
      });

    });

    await Future.delayed(const Duration(milliseconds: 225), () {
      setState(() {
        subPages[newIndex]["opacity"] = 1.0;
      });
    });
  }

  void handleLogin() {
    String username = usernameController.text;
    String password = passwordController.text;

    // Username validation
    if(username.isEmpty) {
      setState(() {
        usernameError = "Please fill in your username";
      });
      SnackBar snackBar = const SnackBar(
        content: Text("Username cannot be empty"),
        duration: Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
    }
    else {
      setState(() {
        usernameError = null;
      });
    }

    // Password Validation
    if (password.isEmpty) {
      setState(() {
        passwordError = "Please fill in your password";
      });
      return;
    }
    else {
      setState(() {
        passwordError = null;
      });
    }

    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return MainPage(username: username, changeTheme: widget.changeTheme,);
    }), 
    (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        changePage(0);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const DecoratedBox(decoration: BoxDecoration(            
                color: Colors.black
              )),
            ),
            Image.asset(
              "/loginpage/login_background.gif",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 300.0
                  ),
                  Image.asset(
                    "logo_alt_2.png",
                    height: 60,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(
                    height: 80.0
                  ),
                  Container(
                    height: 200,
                    child: Stack(
                      children: [
                        
                        /* ========= LANDING PAGE ========== */
                        Visibility(
                          visible: subPages[0]["isVisible"],
                          child: AnimatedOpacity(
                            opacity: subPages[0]["opacity"],
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOutQuad,
                            child: Column(children: [
                              customButton(
                                "Login with Google", 
                                Colors.blueGrey.shade100, 
                                (() { 
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                                    return MainPage(username: "User", changeTheme: widget.changeTheme,);
                                  }), 
                                  (route) => false);
                                }),
                                textColor: Colors.black,
                              ),

                              const SizedBox(
                                height: 10.0
                              ),

                              customButton(
                                "Login to your account", 
                                Colors.blueGrey, 
                                (() => changePage(1))
                              )
                            ]),
                          ),
                        ),

                        /* ========= LOGIN PAGE ========== */
                        Visibility(
                          visible: subPages[1]["isVisible"],
                          child: AnimatedOpacity(
                            opacity: subPages[1]["opacity"],
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOutQuad,
                            child: Column(children: [

                              TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  hintText: "Username",
                                  labelText: "Username",
                                  errorText: usernameError,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  )
                                ),
                              ),

                              const SizedBox(
                                height: 5.0
                              ),

                              TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  labelText: "Password",
                                  errorText: passwordError,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  )
                                ),
                              ),

                              const SizedBox(
                                height: 5.0
                              ),

                              customButton("Login", Colors.blueGrey,() => handleLogin())
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}