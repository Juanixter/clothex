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
        ],
      );
    }
  }
}
