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
          child: Stack(children: [
            _buildText(),
            _buildArrows(),
            _buildConfirm(),
          ]),
        ));
  }

  Widget _buildText() {
    final mapa = widget.datos;
    String? imgRoute = mapa['imagen'];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ColorFiltered(
              colorFilter: ColorFilter.mode(primaryColor, BlendMode.color)),
          Stack(fit: StackFit.loose, children: <Widget>[
            Image.asset(imgRoute!),
            Positioned(
              top: 100,
              left: 95,
              child: Container(
                height: 25,
                width: 97,
                //color: Colors.red,
                child: DefaultTextStyle.merge(
                  style: TextStyle(
                    fontSize: _currentSliderValue,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Center(
                    child: Text(textito),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 517,
              child: Container(
                height: 25,
                width: 110,
                //color: Colors.red,
                child: DefaultTextStyle.merge(
                  style: TextStyle(
                    fontSize: _currentSliderValue,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Center(
                    child: Text(textoEspalda),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 308,
              child: Container(
                height: 25,
                width: 110,
                //color: Colors.red,
                child: DefaultTextStyle.merge(
                  style: TextStyle(
                    fontSize: _currentSliderValue - 7,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Center(
                    child: Text(textoMangas),
                  ),
                ),
              ),
            )
          ]),
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
            selectedBorderColor: Colors.red[700],
            selectedColor: Colors.white,
            fillColor: Colors.red[200],
            color: Colors.red[400],
            constraints: const BoxConstraints(
              minHeight: 30.0,
              minWidth: 80.0,
            ),
            isSelected: _selectedPartes,
            children: partes,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: SizedBox(
              width: 250,
              height: 60,
              child: TextField(
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
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 350, vertical: 5),
              child: SizedBox(
                height: 10,
                child: Slider(
                    value: _currentSliderValue,
                    min: 12,
                    max: 22,
                    divisions: 10,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    }),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blue.withOpacity(0.04);
                      }
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return Colors.blue.withOpacity(0.12);
                      }
                      return null; // Defer to the widget's default.
                    },
                  ),
                ),
                onPressed: () {
                  textito = myController.text;
                  textinho(textito, seleccion);
                  //print(textito);
                },
                child: const Text('Enter')),
          ),
        ],
      ),
    );
  }

  Widget _buildArrows() => Positioned(
      bottom: 44,
      right: 305,
      left: 305,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonMinWidth: 80.0, // Adjust the minimum widtof buttons
        buttonHeight: 40.0, // Adjust the height of buttons
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed('/select_color');
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
            child: const Text("Texto 3/3",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed('/select_material_screen');
            },
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            label: const Text(""),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          ),
        ],
      ));

  Widget _buildConfirm() => Positioned(
      bottom: 0.5,
      right: 305,
      left: 305,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/home_screen');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )),
          child: const Text(
            'Confirm',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ));
}
