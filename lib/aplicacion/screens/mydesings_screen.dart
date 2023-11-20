import 'package:clothex_app/aplicacion/screens/no_designs_screen.dart';
import 'package:clothex_app/aplicacion/widgets/clothex_bottom_bar.dart';
import 'package:clothex_app/dominio/design.dart';
import 'package:clothex_app/infraestructura/firebase_service.dart';
import 'package:flutter/material.dart';

class MyDesignsScreen extends StatelessWidget {
  const MyDesignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDesigns(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const NoDesignsScreen();
          } else {
            snapshot.data!.sort(
              (a, b) => a["date"].compareTo(b["date"]),
            );
            return Scaffold(
              appBar: AppBar(
                title: const Text('MIS DISEÑOS'),
                automaticallyImplyLeading: false,
              ),
              body: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return DesignCard(
                    design: Design(
                      titulo: snapshot.data?[index]['titulo'],
                      tipo: snapshot.data?[index]['tipo'],
                      material: snapshot.data?[index]['material']['nombre'],
                      talla: snapshot.data?[index]['talla']['nombre'],
                      color: snapshot.data?[index]['color'],
                      zona: snapshot.data?[index]['texto']['zona'],
                      texto: snapshot.data?[index]['texto']['string'],
                      urlFront: snapshot.data?[index]['urlFront'],
                      urlBack: snapshot.data?[index]['urlBack'],
                      fecha: snapshot.data?[index]['date'],
                      tag: '$index',
                    ),
                  );
                },
              ),
              bottomNavigationBar: const ClothexBottomBar(2),
            );
          }
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

class DesignCard extends StatelessWidget {
  final Design design;

  const DesignCard({
    super.key,
    required this.design,
  });

  @override
  Widget build(BuildContext context) {
    Color designColor = Color(design.color);

    double halfWidth = MediaQuery.of(context).size.width / 2;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/design_details', arguments: design);
        },
        style: ElevatedButton.styleFrom(
            surfaceTintColor: Colors.white,
            elevation: 15,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Hero(
                    tag: design.tag,
                    child: SizedBox(
                        width: halfWidth,
                        height: halfWidth,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              designColor.withOpacity(0.6), BlendMode.srcATop),
                          child: Image.network(
                            design.urlFront,
                            fit: BoxFit.contain,
                          ),
                        )),
                  ),
                  SizedBox(
                    width: halfWidth,
                    height: halfWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Text(
                        design.texto,
                        textAlign: TextAlign.center,
                        style: const TextStyle().copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    design.titulo,
                    textAlign: TextAlign.center,
                    style: const TextStyle().copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(design.fecha)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
