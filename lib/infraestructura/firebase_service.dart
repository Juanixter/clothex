import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getClotheTypes() async {
  List types = [];
  CollectionReference collectionReferenceClotheTypes =
      db.collection('TiposDePrenda');

  QuerySnapshot queryTypes = await collectionReferenceClotheTypes.get();

  for (var element in queryTypes.docs) {
    types.add(element.data());
  }

  return types;
}

Future<List> getClotheSubtypes(int docIndex) async {
  List subtypes = [];
  String num = (docIndex + 1).toString();
  String documento = 'Tipo$num';
  CollectionReference mainCollectionRef = db.collection('TiposDePrenda');

  CollectionReference subCollectionRef =
      mainCollectionRef.doc(documento).collection('Subtipos');

  QuerySnapshot querySubtypes = await subCollectionRef.get();

  for (var element in querySubtypes.docs) {
    subtypes.add(element.data());
  }

  return subtypes;
}
