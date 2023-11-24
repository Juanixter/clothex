import 'package:clothex_app/aplicacion/widgets/clothex_bottom_bar.dart';
import 'package:clothex_app/aplicacion/widgets/home_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: IconButton.styleFrom(
            iconSize: 40,
            foregroundColor: Colors.grey,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/designer_screen');
          },
          icon: const Icon(Icons.gesture_rounded),
        ),
        automaticallyImplyLeading: false,
        actions: [
          FirebaseAuth.instance.currentUser != null
              ? IconButton(
                  style: IconButton.styleFrom(
                    iconSize: 40,
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/profile_screen');
                  },
                  icon: const Icon(Icons.person),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(
                        width: 2,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signin_screen');
                    },
                    child: const Text('Iniciar Sesión'),
                  ),
                )
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
      bottomNavigationBar: const ClothexBottomBar(0),
    );
  }
}
