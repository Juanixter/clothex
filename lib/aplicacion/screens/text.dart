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
  String textoTorso = "";
  String textoEspalda = "";
  String textoMangas = "";
  TextEditingController myController = TextEditingController();
  double _currentSliderValue = 12;

  void textinho(String s, String seleccion) {
    setState(() {
      print("Seleccion:   " + seleccion);
      if (seleccion == "Torso") {
        print("chest");
        textoTorso = s;
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
      String s = textoEspalda + textoTorso + textoMangas;
      textoTorso = "";
      textoEspalda = "";
      textoMangas = "";
      if (seleccion == "Torso") {
        textoTorso = s;
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
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: Text(
          'TEEEEST',
          style: const TextStyle()
              .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      ToggleButtons(
        direction: Axis.horizontal,
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < _selectedPartes.length; i++) {
              _selectedPartes[i] = i == index;
              if (_selectedPartes[i]) {
                seleccion = partes[i].toString().split('"')[1];
                print(seleccion);
                //"Mangas", "Pecho", "Espalda"
              }
            }
            moving(seleccion);
          });
        },
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: Colors.green[700],
        selectedColor: Colors.white,
        fillColor: Colors.green[200],
        color: Colors.green[400],
        constraints: const BoxConstraints(
          minHeight: 30.0,
          minWidth: 80.0,
        ),
        isSelected: _selectedPartes,
        children: partes,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: SizedBox(
          width: 250,
          height: 60,
          child: TextField(
            onSubmitted: (value) {
              print(value);
              textinho(value, seleccion);
            },
            controller: myController,
            obscureText: false,
            maxLength: 8,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Texto',
            ),
          ),
        ),
      ),
      SizedBox(
        height: 8,
        width: 200,
        child: Slider(
            value: _currentSliderValue,
            inactiveColor: Colors.grey,
            activeColor: Colors.green,
            min: 12,
            max: 22,
            divisions: 10,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            }),
      ),
    ]);
  }
}
