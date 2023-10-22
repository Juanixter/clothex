import 'package:clothex_app/aplicacion/screens/home_screen.dart';
import 'package:clothex_app/aplicacion/screens/select_pattern_screen.dart';
import 'package:flutter/material.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({super.key});

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
  Text('Algodon'),
  Text('Dri-Fit'),
  Text('Lino'),
  Text('Poliéster'),
  Text('Seda'),
];

@override
class _MaterialScreenState extends State<MaterialScreen> {
  final List<bool> _toggleButtonsSelection =
      ShirtSize.values.map((ShirtSize e) => e == ShirtSize.medium).toList();
  final List<bool> _selectedMaterials = <bool>[
    true,
    false,
    false,
    false,
    false
  ];
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
                                builder: (context) => const HomeScreen()));
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
                      child: const Text("Material 1/4",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PatternScreen()));
                      },
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
                        isSelected: _toggleButtonsSelection,
                        onPressed: (int index) {
                          setState(() {
                            _toggleButtonsSelection[index] =
                                !_toggleButtonsSelection[index];
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
                Flexible(
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
                )),
              ],
            ),
          ),
        ));
  }
}
