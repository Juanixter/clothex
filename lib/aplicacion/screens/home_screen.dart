import 'package:clothex_app/aplicacion/Widgets/clothex_bottom_bar.dart';
import 'package:clothex_app/aplicacion/widgets/home_info.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
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
      body: const HomeInfo(),
      bottomNavigationBar: const ClothexBottomBar(),
    );
  }
}
