import 'package:clothex_app/aplicacion/widgets/clothex_bottom_bar.dart';
import 'package:clothex_app/aplicacion/widgets/home_info.dart';
import 'package:flutter/material.dart';

class MyDesignsScreen extends StatelessWidget {
  // Datos de diseño simulados
  final List<Design> dummyDesigns = [
    Design(
      title: 'Diseño 23',
      imageUrl: 'https://www.soundarts.gr/wp-content/uploads/2022/02/Bad-Bunny-Un-Verano-Sin-Ti.jpg',
    ),
    Design(
      title: 'Diseño 22',
      imageUrl: 'https://www.soundarts.gr/wp-content/uploads/2022/02/Bad-Bunny-Un-Verano-Sin-Ti.jpg',
    ),
    Design(
      title: 'Diseño 31',
      imageUrl: 'https://www.soundarts.gr/wp-content/uploads/2022/02/Bad-Bunny-Un-Verano-Sin-Ti.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MIS DISEÑOS'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navega a la ruta '/home_screen' cuando se presiona el botón de retroceso
            Navigator.of(context).pushNamed('/home_screen');
          },
        ),
      ),
      body: ListView.builder(
        itemCount: dummyDesigns.length,
        itemBuilder: (context, index) {
          return DesignCard(design: dummyDesigns[index]);
        },
      ),
    );
  }
}

class Design {
  final String title;
  final String imageUrl;

  Design({required this.title, required this.imageUrl});
}

class DesignCard extends StatelessWidget {
  final Design design;

  DesignCard({required this.design});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(
            design.imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(design.title),
          ),
        ],
      ),
    );
  }
}