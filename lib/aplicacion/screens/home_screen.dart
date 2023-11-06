import 'package:clothex_app/aplicacion/Widgets/clothex_bottom_bar.dart';
import 'package:clothex_app/aplicacion/widgets/home_info.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              iconSize: 40,
              foregroundColor: Colors.grey,
            ),
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: width < 600
                ? const RadialGradient(
                    tileMode: TileMode.clamp,
                    radius: 1.25,
                    colors: [
                      Colors.black,
                      Color.fromARGB(255, 68, 152, 81),
                      Color.fromARGB(255, 1, 66, 11),
                    ],
                  )
                : const LinearGradient(
                    colors: [
                      Colors.black,
                      Color.fromARGB(255, 68, 152, 81),
                      Color.fromARGB(255, 1, 66, 11),
                    ],
                  ),
          ),
          child: const HomeInfo()),
      bottomNavigationBar: const ClothexBottomBar(),
    );
  }
}
