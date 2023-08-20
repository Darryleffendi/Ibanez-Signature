import 'package:flutter/material.dart';

TextButton homeFeaturedCard(String title, bool isActive, Function onPressed, BuildContext context) {

  double opacityTitle = 0.2;
  double opacitySub = 0;

  if(isActive) {
    opacityTitle = 1;
    opacitySub = 1;
  }

  return TextButton(
    onPressed: (() => onPressed()), 
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 6,
              child: Opacity(
                opacity: opacityTitle,
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: -1.5,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                      fontFamily: 'Modica',
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Opacity(
                opacity: opacitySub,
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Divider(
                      color: Colors.white24,
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        title.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: -1.5,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).primaryColor,
                            fontFamily: 'Modica',
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ]
                ),
              ),
            )
          ]
        ),
        const SizedBox(
          height: 15,
        )
      ]
    )
  );
}