import 'package:clothex_app/infraestructura/firebase_service.dart';
import 'package:flutter/material.dart';

class ClotheTypeScreen extends StatefulWidget {
  const ClotheTypeScreen({super.key});

  @override
  State<ClotheTypeScreen> createState() => _ClotheTypeScreenState();
}

class _ClotheTypeScreenState extends State<ClotheTypeScreen> {
  int currentIndex = 0;

  void changeType(int collectionIndex) {
    setState(() {
      currentIndex = collectionIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        ...snapshot.data!.map((tipo) {
                          //Añadiendo cada tipo en orden
                          indexList.add(tipo['nombre']);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: OutlinedButton(
                              onPressed: () {
                                int index = indexList.indexOf(tipo['nombre']);
                                changeType(index);
                              },
                              child: Text(tipo['nombre']),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: getClotheSubtypes(currentIndex),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.all(10),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Image.network(
                                      snapshot.data?[index]['imagen'],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    snapshot.data?[index]['nombre'],
                                  ),
                                ],
                              ),
                            );
                          },
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
