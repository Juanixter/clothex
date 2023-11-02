import 'package:flutter/material.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width < 600) {
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
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Images/logo.png',
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Text(
                'Una app con la que podras diseñar tus propias prendas de ropa personalizadas, con Clothex los limites son tu imaginación. ¡Anímate y diseña la prenda que siempre has deseado tener!',
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle().copyWith(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
