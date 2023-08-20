import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {

  String username;
  Function logOut;
  Function(bool) changeTheme;

  AccountPage({super.key, required this.username, required this.logOut, required this.changeTheme});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {

    bool isDarkMode = true;
    
    if(Theme.of(context).colorScheme != ColorScheme.dark()) {
      isDarkMode = false;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50
        ),
        Image.asset(
          "user.png",
          height: 100,
          fit: BoxFit.fitHeight,
        ),
        Column(
          children: [
            Text(
              widget.username,
              style: const TextStyle(
                fontFamily: 'Modica',
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const Text(
              "Jakarta, Indonesia",
              style: TextStyle(
                color: Color.fromARGB(139, 255, 255, 255),
                fontFamily: 'Modica',
                fontSize: 12,
              ),
            ),
          ]
        ),
        const Text(
          "GOLD MEMBER",
          style: TextStyle(
            color: Color.fromARGB(221, 245, 205, 95),
            fontFamily: 'Modica',
            fontSize: 14,
          ),
        ),

        Container(
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column( 
                children: const [
                  Text(
                    "0",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'Modica',
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    "Purchases",
                    style: TextStyle(
                      color: Color.fromARGB(139, 255, 255, 255),
                      fontFamily: 'Modica',
                      fontSize: 12,
                    ),
                  ),
                ]
              ),
              Column( 
                children: const [
                  Text(
                    "0",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'Modica',
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    "Reviews",
                    style: TextStyle(
                      color: Color.fromARGB(139, 255, 255, 255),
                      fontFamily: 'Modica',
                      fontSize: 12,
                    ),
                  ),
                ]
              ),
              Column( 
                children: const [
                  Text(
                    "0",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'Modica',
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    "Points",
                    style: TextStyle(
                      color: Color.fromARGB(139, 255, 255, 255),
                      fontFamily: 'Modica',
                      fontSize: 12,
                    ),
                  ),
                ]
              )
            ]
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                SnackBar snackBar = const SnackBar(
                  content: Text("Unauthorized."),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }, 
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 300,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Icon(
                        Icons.person_outline,
                        color: Color.fromARGB(221, 245, 205, 95),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Edit my profile",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Modica',
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          "Update your personal information",
                          style: TextStyle(
                            color: Color.fromARGB(139, 255, 255, 255),
                            fontFamily: 'Modica',
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(child: TextButton(
                  child: Text(
                    "Change to light mode",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Modica',
                    ),
                  ),
                  onPressed: () => widget.changeTheme(false),
                )),
                PopupMenuItem(child: TextButton(
                  child: Text(
                    "Change to dark mode",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Modica',
                    )
                  ),
                  onPressed: () => widget.changeTheme(true),
                ))
              ],
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 300,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Icon(
                        Icons.settings_outlined,
                        color: Color.fromARGB(221, 245, 205, 95),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Settings",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Modica',
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          "Configure display and appearance settings",
                          style: TextStyle(
                            color: Color.fromARGB(139, 255, 255, 255),
                            fontFamily: 'Modica',
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ),
            TextButton(
              onPressed: () => widget.logOut(), 
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 300,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Icon(
                        Icons.logout,
                        color: Color.fromARGB(221, 245, 205, 95),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Sign out",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Modica',
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          "Log out of your account",
                          style: TextStyle(
                            color: Color.fromARGB(139, 255, 255, 255),
                            fontFamily: 'Modica',
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ),

            const SizedBox(
              height: 80
            ),
          ],
        )
      ],
    );
  }
}