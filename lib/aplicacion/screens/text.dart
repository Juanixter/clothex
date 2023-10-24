import 'package:flutter/material.dart';
import 'package:clothex_app/aplicacion/screens/home_screen.dart';

const List<Widget> partes = <Widget>[
  Text('Mangas'),
  Text('Torso'),
  Text('Espalda'),
];

String prenda = "Franela";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 98, 54, 244)),
        useMaterial3: true,
      ),
      home: const TextPage(title: 'Text Page'),
    );
  }
}

class TextPage extends StatefulWidget {
  const TextPage({super.key, required this.title});

  final String title;

  @override
  State<TextPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TextPage> {
  final List<bool> _selectedPartes = <bool>[true, false, false];
  String seleccion = "test";
  String textito = "";
  TextEditingController myController = TextEditingController();
  double _currentSliderValue = 12;

  void textinho(String s) {
    setState(() {
      textito = s;
      myController.text = "";
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(fit: StackFit.loose, children: <Widget>[
            Container(
              color: Colors.blue,
              width: 500,
              height: 200,
            ),
            //Image.asset('assets/images/TShirt Example.//jpg'),
            Positioned(
              top: 100,
              left: 68,
              child: Container(
                height: 25,
                width: 87,
                color: Colors.red,
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
            )
          ]),
          ToggleButtons(
            direction: Axis.horizontal,
            onPressed: (int index) {
              setState(() {
                // The button that is tapped is set to true, and the others to false.

                for (int i = 0; i < _selectedPartes.length; i++) {
                  _selectedPartes[i] = i == index;
                  if (_selectedPartes[i]) {
                    seleccion = partes[i].toString().split('"')[1];
                    print(seleccion);
                    //"Mangas", "Pecho", "Espalda"
                  }
                }
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            selectedBorderColor: Colors.red[700],
            selectedColor: Colors.white,
            fillColor: Colors.red[200],
            color: Colors.red[400],
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 80.0,
            ),
            isSelected: _selectedPartes,
            children: partes,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 250,
              child: TextField(
                controller: myController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Texto',
                ),
              ),
            ),
          ),
          Slider(
            value: _currentSliderValue,
            min: 12,
            max: 22,
            divisions: 10,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
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
                textinho(textito);
                //print(textito);
              },
              child: const Text('Enter')),
        ],
      ),
    );
  }

  Widget _buildArrows() => Positioned(
      bottom: 74,
      right: 305,
      left: 305,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonMinWidth: 80.0, // Adjust the minimum widtof buttons
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
            child: const Text("Texto 4/4",
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

  Widget _buildConfirm() => Positioned(
      bottom: 0.5,
      right: 305,
      left: 305,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () {},
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
