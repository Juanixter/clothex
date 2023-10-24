import 'package:clothex_app/aplicacion/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SelectColorScreen extends StatefulWidget {
  final Object? datos;

  const SelectColorScreen({super.key, required this.datos});

  @override
  _MyPageState createState() => _MyPageState();
}

List mycolors = <Color>[
  Colors.grey,
  Colors.red.shade900,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.yellow,
];

Color primaryColor = mycolors[0];

class _MyPageState extends State<SelectColorScreen> {
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
        child: Center(
          child: Stack(
            children: [
              buildImage(),
              buildArrows(),
              buildColorIcons(),
              buildConfirm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(primaryColor, BlendMode.color),
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
      bottom: 40,
      right: 310,
      left: 310,
      child: Row(
        children: [for (var i = 0; i < 6; i++) buildIconBtn(mycolors[i])],
      ));
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
                color: myColor.withOpacity(0.5),
                size: 25,
              ),
              onPressed: () {
                setState(() {
                  primaryColor = myColor;
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
        buttonMinWidth: 80.0, // Adjust the minimum width of buttons
        buttonHeight: 40.0, // Adjust the height of buttons
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            label: const Text(""),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
            child: const Text("Color 2/4",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
              ;
            },
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            label: const Text(""),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          ),
        ],
      ));

  Widget buildConfirm() => Positioned(
      bottom: 0.5,
      right: 305,
      left: 305,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text(
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
              )),
        ),
      ));
}
