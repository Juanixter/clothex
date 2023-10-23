import 'package:flutter/material.dart';
import 'package:patterns_canvas/patterns_canvas.dart';

class SelectPatternScreen extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

List mycolors = <Color>[
  Colors.red.shade900,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.yellow,
];

Color primaryColor = mycolors[0];

class _MyPageState extends State<SelectPatternScreen> {
  Pattern pattern = Dots(bgColor: Colors.white, fgColor: primaryColor);

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
            buildColorIcons(),
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
          child: Container(
            color: Colors.white,
            child: Image.asset(
              "assets/Images/product6.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      );

  Widget buildColorIcons() => Positioned(
      bottom: 35,
      right: 10,
      child: Row(
        children: [
          for (var i = 0; i < 6; i++) buildIconBtn(mycolors[i]),
        ],
      ));

  Widget buildIconBtn(Color myColor) => Container(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 12.5,
              child: Icon(
                Icons.check,
                size: 20,
                color: primaryColor == myColor ? myColor : Colors.transparent,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.circle,
                color: myColor.withOpacity(1),
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  primaryColor = myColor;
                  if (primaryColor == Colors.red.shade900) {
                    pattern =
                        Dots(bgColor: Colors.white, fgColor: primaryColor);
                  } else if (primaryColor == Colors.blue) {
                    pattern = VerticalStripesLight(
                        bgColor: Colors.white, fgColor: primaryColor);
                  } else if (primaryColor == Colors.green) {
                    pattern = HorizontalStripesLight(
                        bgColor: Colors.white, fgColor: primaryColor);
                  }
                });
              },
            ),
          ],
        ),
      );
}

class MyPainter extends CustomPainter {
  Pattern pattern;

  MyPainter(this.pattern);

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    pattern.paintOnRect(canvas, size, rect);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => oldDelegate.pattern != pattern;
}
