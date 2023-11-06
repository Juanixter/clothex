import 'package:clothex_app/aplicacion/screens/home_screen.dart';
import 'package:clothex_app/aplicacion/screens/signin_screen.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
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
    return Scaffold(
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
                  child: buildButtonToLogin(),
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
            child: Text('Go to Login',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ))),
      );

  Widget buildExitButton() => Padding(
        padding: const EdgeInsets.all(1.0),
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Text('Exit',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ))),
      );
}
