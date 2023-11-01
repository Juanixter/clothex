import 'package:flutter/material.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        const SizedBox(
          height: 150,
        ),
        Image.asset(
          'assets/Images/logo.png',
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: child,
            );
          },
          child: const Text('Probando'),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Una app con la que podras diseñar tus propias prendas de ropa personalizadas, con Clothex los limites son tu imaginación. ¡Anímate y diseña la prenda que siempre haz deseado tener!',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
