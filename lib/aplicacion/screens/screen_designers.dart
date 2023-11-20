import 'package:clothex_app/aplicacion/screens/designerDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:clothex_app/dominio/designers.dart';

class DesignersScreen extends StatelessWidget {
  // Datos de diseño simulados
  final List<Designers> dummyDesigns = [
    Designers(
        title: 'Michael Basquiat',
        imageUrl:
            'https://render.fineartamerica.com/images/rendered/default/print/8/4/break/images/artworkimages/medium/1/andy-warhol-and-jean-michel-basquiat-richard-day.jpg',
        designerImageUrl:
            'https://upload.wikimedia.org/wikipedia/en/5/51/Jean-Michel_Basquiat_1982_by_Andy_Warhol.png', // URL de la imagen del diseñador para el Diseño 1
        shirt1:
            'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/446065/item/goods_09_446065.jpg',
        shirt2:
            'https://www.romepaysoff.com/cdn/shop/products/CREWNECK-BLACK-PEZ-FRONT.png?v=1669843068&width=700',
        frase1: 'La moda es una forma de arte. Nunca se trata solo de ropa.',
        frase2: 'La verdadera elegancia está en la mente del portador'),
    Designers(
        title: 'Keith Haring',
        imageUrl:
            'https://unperroviejo.files.wordpress.com/2014/05/keith-haring-characters.jpg',
        designerImageUrl:
            'https://historia-arte.com/_/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpbSI6WyJcL2FydGlzdFwvaW1hZ2VGaWxlXC82OTgzMzIwMzE5X2FhNDQ5ZTYyYmNfYi5qcGciLCJyZXNpemUsNjAwLDYwMCJdfQ.xvq8e8EEDDfIB2PyV6KdXcTTW3RN8mehS0DIA1E0qjU.jpg', // URL de la imagen del diseñador para el Diseño 2
        shirt1:
            'https://degraffitis.com/wp-content/uploads/2022/01/Camiseta-Keith-Haring-Manga-corta-ninos.jpg',
        shirt2:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc6d4eV1l2_6CvU2QFy83tCtZunTpOcqzxgw&usqp=CAU',
        frase1: 'Al final, la moda es una forma de expresión personal.',
        frase2: 'La moda debería ser una forma de escapar, no algo que te aprisione.'),
    Designers(
        title: 'Tomoaki Nagao (BAPE)',
        imageUrl:
            'https://img.buzzfeed.com/buzzfeed-static/complex/images/hivtwrgfrnc61yfy8rig/bape.jpg?output-format=jpg&output-quality=auto',
        designerImageUrl:
            'https://www.menswearstyle.co.uk/content/blogs/d45a366d-b9e9-4a42-b04c-2e36a14bb96d_blog_ln_.jpg', // URL de la imagen del diseñador para el Diseño 3
        shirt1:
            'https://images.stockx.com/images/Bape-Abc-Camo-By-Bathing-Tee-White-Blue.jpg?fit=fill&bg=FFFFFF&w=480&h=320&fm=jpg&auto=compress&dpr=2&trim=color&updated_at=1613343723&q=60',
        shirt2:
            'https://ithk-pro-itmall-item.oss-cn-hongkong.aliyuncs.com/2/product/0ZXTEW210080LWHX/0ZXTEW210080LWHX-pdp-1.jpg?x-oss-process=image/resize,m_pad,h_750,w_600/auto-orient,1/quality,Q_80',
        frase1: 'La moda es una oportunidad para expresarse y destacar.',
        frase2: 'La moda es una forma de decir quién eres sin tener que hablar.'),
  ];

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('DISEÑADORES'),
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

class DesignCard extends StatelessWidget {
  final Designers design;

  DesignCard({required this.design});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .pushNamed('/designers_detail_screen', arguments: design);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Ajusta el radio de los bordes
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.5),
        child: Column(
          children: <Widget>[
            Hero(
              tag: design.imageUrl,
              child: Image.network(
                design.imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 26.0,
                    backgroundImage: NetworkImage(design.designerImageUrl),
                  ),
                  SizedBox(width: 7.5),
                  Text(design.title),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
