import 'package:clothex_app/aplicacion/screens/home_screen.dart';
import 'package:clothex_app/aplicacion/screens/pattern_screen.dart';
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

  void _saveToggleButtonsValues() {
    // Save the values of the toggle buttons here
    // You can access the selected values using _selectedMaterials and _toggleButtonsSelection lists
    // Perform any necessary operations with the selected values
    // For example, you can print them to the console
    print('Selected materials: $_selectedMaterials');
    print('Selected shirt sizes: $_toggleButtonsSelection');
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
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
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: const Text("Material 1/4",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectPatternScreen()));
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
                    onPressed: () {
                      _saveToggleButtonsValues();
                    },
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
