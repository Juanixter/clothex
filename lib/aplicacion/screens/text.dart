import 'package:clothex_app/aplicacion/screens/select_color_screen.dart';
import 'package:flutter/material.dart';

const List<Widget> partes = <Widget>[
  Text('Mangas'),
  Text('Torso'),
  Text('Espalda'),
];

//String prenda = "Franela";

// ignore: must_be_immutable
class TextPage extends StatefulWidget {
  final Map<String, dynamic> datos;
  final Function onDataChange;

  const TextPage({super.key, required this.datos, required this.onDataChange});

  @override
  State<TextPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TextPage> {
  final List<bool> _selectedPartes = <bool>[true, false, false];
  String seleccion = "Mangas";
  String textito = "";
  String textoEspalda = "";
  String textoMangas = "";
  TextEditingController myController = TextEditingController();
  double _currentSliderValue = 12;

  void textinho(String s, String seleccion) {
    setState(() {
      print("Seleccion:   " + seleccion);
      if (seleccion == "Torso") {
        print("chest");
        textito = s;
      } else if (seleccion == "Espalda") {
        print("back");
        textoEspalda = s;
      } else {
        print("sleeves");
        textoMangas = s;
      }

      myController.text = "";
    });
  }

  void moving(String seleccion) {
    setState(() {
      String s = textoEspalda + textito + textoMangas;
      textito = "";
      textoEspalda = "";
      textoMangas = "";
      if (seleccion == "Torso") {
        textito = s;
      } else if (seleccion == "Espalda") {
        textoEspalda = s;
      } else {
        textoMangas = s;
      }
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
        child: Text(
          'TEEEEST',
          style: const TextStyle()
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
