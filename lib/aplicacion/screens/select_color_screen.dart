import 'dart:ui';

import 'package:clothex_app/dominio/prendas.dart';
import 'package:flutter/material.dart';

class SelectColorScreen extends StatefulWidget {
  final Map<String, dynamic> datos;
  final Function onDataChange;

  const SelectColorScreen({
    super.key,
    required this.datos,
    required this.onDataChange,
  });

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
  Colors.black
];

Color primaryColor = mycolors[0];

class _MyPageState extends State<SelectColorScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
          child: Text(
            'Colores',
            style: const TextStyle()
                .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...mycolors.take(4).map(
                (color) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      style: IconButton.styleFrom(iconSize: 50),
                      color: color,
                      onPressed: () {
                        widget.datos['color'] = color;
                        widget.onDataChange(widget.datos);
                      },
                      icon: const Icon(Icons.circle),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...mycolors.getRange(4, 7).map(
                (color) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      style: IconButton.styleFrom(iconSize: 50),
                      color: color,
                      onPressed: () {
                        widget.datos['color'] = color;
                        widget.onDataChange(widget.datos);
                      },
                      icon: const Icon(Icons.circle),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        if (!tiposDePrenda.contains(widget.datos['tipo']))
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/checkout_screen', arguments: widget.datos);
              },
              child: const Text('¡Termina tu diseño!'),
            ),
          ),
      ],
    );
  }

  Widget buildImage() => Container(
        width: 200,
        height: 200,
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
              Navigator.pop(context);
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
            child: const Text("Color 2/3",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton.icon(
            onPressed: () {
              final mapa = widget.datos as Map<String, String>;

              mapa['color'] = primaryColor.toString();
              mapa['imagen'] = 'assets/Images/product6.png';
              Navigator.of(context).pushNamed('/text_page', arguments: mapa);
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
