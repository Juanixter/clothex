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

@override
class _MaterialScreenState extends State<MaterialScreen> {
  final List<bool> _toggleButtonsSelection = <bool>[
    true,
    false,
    false,
    false,
    false
  ];

  int currentMaterialIndex = 0;

  List<bool> getSelectedMaterials(int selectedIndex) {
    List<bool> lista = [];

    for (int i = 0; i < widget.datos['materiales_posibles'].length; i++) {
      if (i == selectedIndex) {
        lista.add(true);
      } else {
        lista.add(false);
      }
    }

    return lista;
  }

  List<Widget> materialsList() {
    List<Widget> lista = [];

    for (var material in widget.datos['materiales_posibles']) {
      lista.add(Text(material));
    }

    return lista;
  }

  void onSelection() {
    int tallaIndex = _toggleButtonsSelection.indexOf(true);

    final List<Widget> materials = materialsList();
    String material = materials[currentMaterialIndex].toString();
    String talla = shirtSizeOptions[tallaIndex].$2;

    widget.datos['material'] = {
      "nombre": material,
      "indice": currentMaterialIndex,
    };
    widget.datos['talla'] = {
      "nombre": talla,
      "indice": tallaIndex,
    };

    widget.onDataChange(widget.datos);
  }

  @override
  Widget build(BuildContext context) {
    currentMaterialIndex = widget.datos['material']['indice'];
    if (widget.datos['talla'] != null) {
      _toggleButtonsSelection[_toggleButtonsSelection.indexOf(true)] = false;
      _toggleButtonsSelection[widget.datos['talla']['indice']] = true;
    }

    final List<bool> selectedMaterials =
        getSelectedMaterials(currentMaterialIndex);

    final List<Widget> materials = materialsList();

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
                  currentMaterialIndex = index;
                  onSelection();
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.grey,
                selectedColor: Colors.white,
                fillColor: Colors.green,
                color: Colors.black,
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: selectedMaterials,
                children: materials,
              )),
        ),
        Flexible(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: ToggleButtons(
                fillColor: Colors.green,
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
