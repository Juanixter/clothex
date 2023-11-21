import 'package:flutter/material.dart';
import 'package:clothex_app/dominio/designers.dart';

class DesignerDetailsScreen extends StatelessWidget {
  final Designers design;

  const DesignerDetailsScreen({super.key, required this.design});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(design.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen del diseñador
            Hero(
              tag: design.imageUrl,
              child: Image.network(
                design.imageUrl,
                width: double.infinity,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),

            // Título del diseñador
            Text(
              design.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Imágenes adicionales con texto
            // Puedes agregar más elementos a esta lista según sea necesario
            ImageWithText(
              imageUrl: design.imageUrl,
              text: design.title,
              shirt1: design.shirt1,
              shirt2: design.shirt2,
              frase1: design.frase1,
              frase2: design.frase2,
              designerImageUrl: design.designerImageUrl,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageWithText extends StatelessWidget {
  final String imageUrl;
  final String text;
  final String shirt1;
  final String shirt2;
  final String frase1;
  final String frase2;
  final String designerImageUrl;

  const ImageWithText(
      {super.key,
      required this.imageUrl,
      required this.text,
      required this.frase1,
      required this.frase2,
      required this.shirt1,
      required this.shirt2,
      required this.designerImageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          shirt1,
          width: double.infinity,
          height: 250,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 10),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 26.0,
                backgroundImage: NetworkImage(designerImageUrl),
              ),
              const SizedBox(width: 7.5),
              SizedBox(
                width: 150,
                height: 50,
                child: Text(frase1, softWrap: true),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Image.network(
          shirt2,
          width: double.infinity,
          height: 250,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 10),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 26.0,
                backgroundImage: NetworkImage(designerImageUrl),
              ),
              const SizedBox(width: 7.5),
              SizedBox(
                width: 150,
                height: 50,
                child: Text(frase2, softWrap: true),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
