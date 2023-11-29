import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Images/logo.png',
          ),
          const SizedBox(
            width: 1800,
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Images/logo.png',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Una app con la que podras diseñar tus propias prendas de ropa personalizadas, con Clothex los limites son tu imaginación. ¡Anímate y diseña la prenda que siempre has deseado tener!',
            textAlign: TextAlign.center,
            style: const TextStyle().copyWith(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
  }
}
