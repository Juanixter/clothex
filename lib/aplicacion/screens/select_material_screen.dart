import 'package:flutter/material.dart';

class MaterialScreen extends StatefulWidget {
  final Map<String, dynamic> datos;

  final Function onDataChange;

  const MaterialScreen(
      {required this.datos, required this.onDataChange, super.key});

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

  void onSelection() {
    int materialIndex = _selectedMaterials.indexOf(true);
    int sizeIndex = _toggleButtonsSelection.indexOf(true);

    String material = materials[materialIndex].toString();
    String talla = shirtSizeOptions[sizeIndex].$2;

    widget.datos['material'] = material;
    widget.datos['talla'] = talla;

    widget.onDataChange(widget.datos);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
          child: Text(
            'Material y Talla',
            style: const TextStyle()
                .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ToggleButtons(
                onPressed: (int index) {
                  // The button that is tapped is set to true, and the others to false.
                  for (int i = 0; i < _selectedMaterials.length; i++) {
                    _selectedMaterials[i] = i == index;
                  }
                  onSelection();
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                  for (int i = 0; i < _toggleButtonsSelection.length; i++) {
                    _toggleButtonsSelection[i] = i == index;
                  }
                  onSelection();
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
    );
  }
}
