import 'package:flutter/material.dart';

class MaterialScreen extends StatefulWidget {
  final Object? datos;

  const MaterialScreen({required this.datos, super.key});

  @override
  State<StatefulWidget> createState() {
    return _MaterialScreenState();
  }
}

enum ShirtSize { extraSmall, small, medium, large, extraLarge }

const List<(ShirtSize, String)> shirtSizeOptions = <(ShirtSize, String)>[
  (ShirtSize.extraSmall, 'XS'),
  (ShirtSize.small, 'S'),
  (ShirtSize.medium, 'M'),
  (ShirtSize.large, 'L'),
  (ShirtSize.extraLarge, 'XL'),
];

const List<Widget> materials = <Widget>[
  Text('Algodón'),
  Text('Dri-Fit'),
  Text('Lino'),
  Text('Poliéster'),
];

@override
class _MaterialScreenState extends State<MaterialScreen> {
  final List<bool> _toggleButtonsSelection = <bool>[
    true,
    false,
    false,
    false,
    false
  ];
  final List<bool> _selectedMaterials = <bool>[true, false, false, false];

  void nextScreen() {
    final mapa = widget.datos as Map<String, String>;
    int materialIndex = _selectedMaterials.indexOf(true);
    int sizeIndex = _toggleButtonsSelection.indexOf(true);

    String material = materials[materialIndex].toString();
    String talla = shirtSizeOptions[sizeIndex].$2;

    mapa['material'] = material;
    mapa['talla'] = talla;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData().copyWith(
              color: Colors.black,
            ),
            title: const Text('Clothex App',
                style: TextStyle(color: Colors.black, fontSize: 30))),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 5,
                  child: Image.asset(
                    "assets/Images/product6.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Flexible(
                    child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonMinWidth: 80.0, // Adjust the minimum width of buttons
                  buttonHeight: 40.0, // Adjust the height of buttons
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      label: const Text(""),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: const Text("Material 1/4",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton.icon(
                      onPressed: nextScreen,
                      icon:
                          const Icon(Icons.arrow_forward, color: Colors.black),
                      label: const Text(""),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    ),
                  ],
                )),
                Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ToggleButtons(
                        onPressed: (int index) {
                          setState(() {
                            // The button that is tapped is set to true, and the others to false.
                            for (int i = 0;
                                i < _selectedMaterials.length;
                                i++) {
                              _selectedMaterials[i] = i == index;
                            }
                          });
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        selectedBorderColor: Colors.grey,
                        selectedColor: Colors.white,
                        fillColor: Colors.blue[200],
                        color: Colors.black,
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                          minWidth: 80.0,
                        ),
                        isSelected: _selectedMaterials,
                        children: materials,
                      )),
                ),
                Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ToggleButtons(
                        fillColor: Colors.blue[200],
                        selectedColor: Colors.white,
                        isSelected: _toggleButtonsSelection,
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0;
                                i < _toggleButtonsSelection.length;
                                i++) {
                              _toggleButtonsSelection[i] = i == index;
                            }
                          });
                        },
                        constraints: const BoxConstraints(
                          minHeight: 32.0,
                          minWidth: 56.0,
                        ),
                        children: shirtSizeOptions
                            .map(((ShirtSize, String) shirt) => Text(shirt.$2))
                            .toList(),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
