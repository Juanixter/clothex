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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Clothex App',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
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
          numberOfParticles: 100,
        )
      ]);
}

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
        'Tu diseño está listo!',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
