import 'package:flutter/material.dart';

class ClotheTypeScreen extends StatelessWidget {
  const ClotheTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData().copyWith(
          color: Colors.black,
        ),
      ),
      body: const Center(
        child: Text('Select Type'),
      ),
    );
  }
}
