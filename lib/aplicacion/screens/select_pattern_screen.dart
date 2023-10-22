import 'package:clothex_app/aplicacion/screens/select_material_screen.dart';
import 'package:flutter/material.dart';

class PatternScreen extends StatefulWidget {
  const PatternScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PatternScreenState();
  }
}

class _PatternScreenState extends State<PatternScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text('Clothex',
                style: TextStyle(
                  color: Colors.black,
                ))),
        body: Container(
            color: Colors.white,
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Flexible(
                    flex: 5,
                    child: const Image(
                        image: NetworkImage(
                            'https://as1.ftcdn.net/v2/jpg/05/76/36/90/1000_F_576369054_WOwqFMsGcf58Ti0yN5700bBSz0w2w4is.jpg')),
                  ),
                  Flexible(
                      child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonMinWidth: 80.0, // Adjust the minimum width of buttons
                    buttonHeight: 40.0, // Adjust the height of buttons
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MaterialScreen()));
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        label: const Text(""),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Patrón 3/4",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward,
                            color: Colors.black),
                        label: const Text(""),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                      ),
                    ],
                  )),
                  Flexible(
                      child: ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Polka Dots',
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
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Rayas Horizontales',
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
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Rayas Verticales',
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
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Objetos',
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
                      ])),
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Área',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  )),
                  Flexible(
                      child: ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Torso',
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
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Manga Derecha',
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
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Manga Izquierda',
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
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Espalda',
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
                      ]))
                ]))));
  }
}
