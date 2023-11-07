import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:patterns_canvas/patterns_canvas.dart';

class SelectPatternScreen extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

List<Color> myColors = <Color>[
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.yellow,
  Colors.black,
];

Color primaryColor = myColors[0];

class _MyPageState extends State<SelectPatternScreen> {
  Pattern pattern = Dots(bgColor: Colors.white, fgColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Clothex App',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            buildImage(),
            buildArrows(),
            buildColorIcons(),
            buildConfirm(),
          ],
        ),
      ),
    );
  }

  Widget buildImage() => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CustomPaint(
          painter: MyPainter(pattern),
          child: Image.asset(
            "assets/Images/product6.png",
            fit: BoxFit.contain,
          ),
        ),
      );

  Widget buildColorIcons() => Positioned(
        bottom: 35,
        right: 304,
        left: 304,
        child: Row(
          children: [
            for (var i = 0; i < myColors.length; i++) buildIconBtn(myColors[i]),
          ],
        ),
      );

  Widget buildIconBtn(Color myColor) => Center(
        child: Stack(
          children: [
            Positioned(
              top: 12,
              right: 12,
              child: Icon(
                Icons.check,
                size: 16,
                color: primaryColor == myColor ? myColor : Colors.transparent,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.circle,
                color: myColor.withOpacity(1),
                size: 25,
              ),
              onPressed: () {
                setState(() {
                  primaryColor = myColor;

                  if (primaryColor == Colors.red) {
                    pattern = Dots(
                        bgColor: Colors.transparent, fgColor: primaryColor);
                  } else if (primaryColor == Colors.blue) {
                    pattern = VerticalStripesLight(
                        bgColor: Colors.transparent, fgColor: primaryColor);
                  } else if (primaryColor == Colors.green) {
                    pattern = HorizontalStripesLight(
                        bgColor: Colors.transparent, fgColor: primaryColor);
                  } else if (primaryColor == Colors.purple) {
                    pattern = HorizontalStripesLight(
                        bgColor: Colors.transparent, fgColor: primaryColor);
                  } else if (primaryColor == Colors.orange) {
                    pattern = VerticalStripesLight(
                        bgColor: Colors.transparent, fgColor: primaryColor);
                  } else if (primaryColor == Colors.yellow) {
                    pattern = Dots(
                        bgColor: Colors.transparent, fgColor: primaryColor);
                  } else if (primaryColor == Colors.black) {
                    pattern = Dots(
                        bgColor: Colors.transparent, fgColor: Colors.white);
                  }
                });
              },
            ),
          ],
        ),
      );

  Widget buildArrows() => Positioned(
        bottom: 74,
        right: 305,
        left: 305,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonMinWidth: 80.0,
          buttonHeight: 40.0,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); // Use Navigator.pop to go back
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              label: Text(""),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              child: Text("Patrón 3/4",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to the next screen or perform the next action
              },
              icon: Icon(Icons.arrow_forward, color: Colors.black),
              label: Text(""),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
          ],
        ),
      );

  Widget buildConfirm() => Positioned(
        bottom: 8,
        right: 305,
        left: 305,
        child: ElevatedButton(
          onPressed: () {
            // Handle the confirmation action
          },
          child: Text(
            'Confirm',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
}

class MyPainter extends CustomPainter {
  Pattern pattern;

  MyPainter(this.pattern);

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Usar srcOver para pintar sobre la imagen
    Paint paint = Paint()..blendMode = BlendMode.srcOver;
    // Pintar el patrón en el canvas
    pattern.paintOnRect(canvas, size, rect);
  }
  @override
  bool shouldRepaint(MyPainter oldDelegate) => oldDelegate.pattern != pattern;
}
