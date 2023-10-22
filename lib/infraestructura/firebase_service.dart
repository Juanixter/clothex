import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getClotheTypes() async {
  List types = [];
  CollectionReference collectionReferenceClotheTypes =
      db.collection('TiposDePrenda');

  QuerySnapshot queryTypes = await collectionReferenceClotheTypes.get();

  queryTypes.docs.forEach((element) {
    types.add(element.data());
  });

  return types;
}
