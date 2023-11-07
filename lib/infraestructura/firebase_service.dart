import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

Future<void> addDesign(Map<String, dynamic> datos, String id) async {
  await db.collection('Usuarios').doc(id).collection('diseños').add(datos);
}

Future<List> getDesigns() async {
  List designs = [];
  CollectionReference crUsers = db.collection('Usuarios');

  CollectionReference subCollectionRef =
      crUsers.doc(FirebaseAuth.instance.currentUser!.uid).collection('diseños');

  QuerySnapshot queryDesigns = await subCollectionRef.get();

  for (var element in queryDesigns.docs) {
    designs.add(element.data());
  }

  return designs;
}
