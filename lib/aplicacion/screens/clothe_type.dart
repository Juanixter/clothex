import 'package:clothex_app/infraestructura/firebase_service.dart';
import 'package:flutter/material.dart';

class ClotheTypeScreen extends StatefulWidget {
  const ClotheTypeScreen({super.key});

  @override
  State<ClotheTypeScreen> createState() => _ClotheTypeScreenState();
}

class _ClotheTypeScreenState extends State<ClotheTypeScreen> {
  int currentIndex = 0;
  Map<String, dynamic> datos = {
    "tipo": '',
    "img_front": null,
    "img_back": null,
    "texto": {"string": "", "size": 0, "zona": ""}
  };

  void changeType(int collectionIndex) {
    setState(() {
      currentIndex = collectionIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData().copyWith(
            color: Colors.black,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home_screen');
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: FutureBuilder(
          future: getClotheTypes(),
          builder: (context, snapshot) {
            //Lista para saber los indices de cada elemento
            List<String> indexList = [];

            if (snapshot.hasData) {
              if (datos['materiales_posibles'] == null) {
                datos['materiales_posibles'] = snapshot.data![0]['materiales'];
              }
              return Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...snapshot.data!.map(
                          (tipo) {
                            //Añadiendo cada tipo en orden
                            indexList.add(tipo['nombre']);
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      indexList.indexOf(tipo['nombre']) ==
                                              currentIndex
                                          ? Colors.green[700]
                                          : Colors.white,
                                  side: const BorderSide(width: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                ),
                                onPressed: () {
                                  int index = indexList.indexOf(tipo['nombre']);
                                  datos['materiales_posibles'] =
                                      snapshot.data![index]['materiales'];
                                  changeType(index);
                                },
                                child: Text(
                                  tipo['nombre'],
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: getClotheSubtypes(currentIndex),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(10),
                            shrinkWrap: true,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 7,
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.all(10),
                                  ),
                                  onPressed: () {
                                    Widget front = Image.network(
                                      snapshot.data?[index]['img_front'],
                                      fit: BoxFit.contain,
                                    );
                                    Widget back = Image.network(
                                      snapshot.data?[index]['img_back'],
                                      fit: BoxFit.contain,
                                    );
                                    datos['urlFront'] =
                                        snapshot.data?[index]['img_front'];
                                    datos['urlBack'] =
                                        snapshot.data?[index]['img_back'];
                                    datos['tipo'] =
                                        snapshot.data?[index]['nombre'];
                                    datos['img_front'] = front;
                                    datos['img_back'] = back;
                                    datos['color'] = Colors.white;
                                    datos['material'] = {
                                      "nombre": 'Text("Algodón")',
                                      "indice": 0,
                                    };
                                    datos['talla'] = {
                                      "nombre": "XS",
                                      "indice": 0,
                                    };
                                    Navigator.of(context).pushReplacementNamed(
                                        '/design_screen',
                                        arguments: datos);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        height: 150,
                                        child: Image.network(
                                          snapshot.data?[index]['img_front'],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          snapshot.data?[index]['nombre'],
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Text('');
                      }
                    },
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
