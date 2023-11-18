import 'package:clothex_app/aplicacion/screens/home_screen.dart';
import 'package:clothex_app/aplicacion/screens/signin_screen.dart';
import 'package:clothex_app/infraestructura/firebase_service.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({super.key, this.datos});

  Map<String, dynamic>? datos;

  @override
  State<StatefulWidget> createState() {
    return _CheckoutScreen();
  }
}

class _CheckoutScreen extends State<CheckoutScreen> {
  bool isPlaying = false;
  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();

    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    widget.datos?['img_front'] = null;
    widget.datos?['img_back'] = null;

    Color currentClotheColor = widget.datos?['color'] as Color;
    int colorValue = currentClotheColor.value;
    widget.datos?['color'] = colorValue;

    return Scaffold(
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildConfetti(),
                ),
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
                  child: FirebaseAuth.instance.currentUser != null
                      ? null
                      : buildButtonToLogin(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildExitButton(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildConfetti() => Stack(alignment: Alignment.topCenter, children: [
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: false,
          blastDirectionality: BlastDirectionality.explosive,
          emissionFrequency: 0.00,
          numberOfParticles: 200,
        )
      ]);

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/Images/checkmark.png",
          width: 550,
          height: 350,
          fit: BoxFit.contain,
        ),
      );

  Widget buildText() => (const FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.bottomCenter,
        child: Text(
          '''
                            ¡Tu diseño está listo! 
¡Registrate en la aplicación para poder ver tu diseño!''',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));

  Widget buildButtonToLogin() => Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
            child: const Text('Go to Login',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ))),
      );

  Widget buildExitButton() => Padding(
        padding: const EdgeInsets.all(1.0),
        child: ElevatedButton(
            onPressed: () {
              final id = FirebaseAuth.instance.currentUser?.uid;
              if (widget.datos != null && id != null) {
                addDesign(widget.datos!, id);
              }
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
            child: const Text('Exit',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))),
      );
}
