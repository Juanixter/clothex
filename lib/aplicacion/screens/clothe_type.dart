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
        ),
        body: FutureBuilder(
          future: getClotheTypes(),
          builder: (context, snapshot) {
            //Lista para saber los indices de cada elemento
            List<String> indexList = [];

            if (snapshot.hasData) {
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
                                          ? Colors.green[200]
                                          : Colors.white,
                                  side: const BorderSide(width: 1.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  int index = indexList.indexOf(tipo['nombre']);
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
                                    datos['tipo'] =
                                        snapshot.data?[index]['nombre'];
                                    datos['img_front'] = front;
                                    datos['img_back'] = back;
                                    Navigator.of(context).pushNamed(
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
