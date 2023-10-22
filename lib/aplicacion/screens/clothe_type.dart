import 'package:clothex_app/infraestructura/firebase_service.dart';
import 'package:flutter/material.dart';

class ClotheTypeScreen extends StatefulWidget {
  const ClotheTypeScreen({super.key});

  @override
  State<ClotheTypeScreen> createState() => _ClotheTypeScreenState();
}

class _ClotheTypeScreenState extends State<ClotheTypeScreen> {
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
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data?[index]['nombre']);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
