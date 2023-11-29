import 'package:clothex_app/aplicacion/screens/clothe_type.dart';
import 'package:clothex_app/aplicacion/widgets/clothex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NoDesignsScreen extends StatefulWidget {
  const NoDesignsScreen({super.key});

  @override
  State<NoDesignsScreen> createState() => _NoDesignsScreenState();
}

class _NoDesignsScreenState extends State<NoDesignsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    child: const Text('Terminar sesión'),
                  ),
                )
              : IconButton(
                  style: IconButton.styleFrom(
                    iconSize: 40,
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signin_screen');
                  },
                  icon: const Icon(Icons.person),
                ),
        ],
      ),
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildImage(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildText(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildButtonToScreen(),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const ClothexBottomBar(2),
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/Images/empty_cart.png",
          width: 550,
          height: 350,
          fit: BoxFit.contain,
        ),
      );

  Widget buildText() => (const FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.bottomCenter,
        child: Text(
          '''No tienes diseños todavía!''',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));

  Widget buildButtonToScreen() => Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ClotheTypeScreen()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
            child: const Text('Empieza a diseñar!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ))),
      );
}
