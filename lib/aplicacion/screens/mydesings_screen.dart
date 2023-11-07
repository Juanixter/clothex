import 'package:clothex_app/infraestructura/firebase_service.dart';
import 'package:flutter/material.dart';

class MyDesignsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDesigns(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('MIS DISEÑOS'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Navega a la ruta '/home_screen' cuando se presiona el botón de retroceso
                  Navigator.of(context).pushNamed('/home_screen');
                },
              ),
            ),
            body: ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return DesignCard(
                  design: Design(
                      titulo: "Diseño ${index + 1}",
                      tipo: snapshot.data?[index]['tipo'],
                      material: snapshot.data?[index]['material']['nombre'],
                      talla: snapshot.data?[index]['talla']['nombre'],
                      color: snapshot.data?[index]['color'],
                      zona: snapshot.data?[index]['texto']['zona'],
                      texto: snapshot.data?[index]['texto']['string']),
                );
              },
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }),
    );
  }
}

class Design {
  final String titulo;
  final int color;
  final String material;
  final String talla;
  final String texto;
  final String zona;
  final String tipo;

  Design(
      {required this.color,
      required this.material,
      required this.talla,
      required this.texto,
      required this.zona,
      required this.tipo,
      required this.titulo});
}

class DesignCard extends StatelessWidget {
  final Design design;

  const DesignCard({super.key, required this.design});

  @override
  Widget build(BuildContext context) {
    String removeText = design.material.replaceAll('Text(', '');
    String removeParenthesis = removeText.replaceAll(')', '');
    String materialString = removeParenthesis.replaceAll('"', '');

    Color designColor = Color(design.color);

    return Card(
      color: designColor.withOpacity(0.5),
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              textAlign: TextAlign.center,
              design.titulo,
              style: const TextStyle().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Tipo: ${design.tipo}'),
          ),
          ListTile(
            title: Text('Material: $materialString'),
          ),
          ListTile(
            title: Text('Talla: ${design.talla}'),
          ),
          if (design.zona != "")
            ListTile(
              title: Text('Zona de texto: ${design.zona}'),
            ),
          if (design.texto != "")
            ListTile(
              title: Text('Texto: ${design.texto}'),
            ),
        ],
      ),
    );
  }
}
