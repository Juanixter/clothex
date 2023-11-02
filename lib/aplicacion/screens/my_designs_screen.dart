import 'package:flutter/material.dart';

class MyDesignsScreen extends StatelessWidget {
  const MyDesignsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: const Text('My Designs',
            style: TextStyle(color: Colors.black, fontSize: 30)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey[300],
                      height: 200,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
