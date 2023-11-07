import 'package:clothex_app/aplicacion/screens/design_screen.dart';
import 'package:clothex_app/aplicacion/screens/checkout_screen.dart';
import 'package:clothex_app/aplicacion/screens/home_screen.dart';
import 'package:clothex_app/aplicacion/screens/clothe_type.dart';

import 'package:clothex_app/aplicacion/screens/signin_screen.dart';

import 'package:clothex_app/aplicacion/screens/myDesings_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/home_screen':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case '/select_clothe_type':
        return MaterialPageRoute(
            builder: (context) => const ClotheTypeScreen());
      case '/design_screen':
        return MaterialPageRoute(
            builder: (context) =>
                DesignScreen(datos: args as Map<String, dynamic>));
      case '/checkout_screen':
        return MaterialPageRoute(
            builder: (context) => CheckoutScreen(
                  datos: args as Map<String, dynamic>,
                ));
      case '/signin_screen':
        return MaterialPageRoute(
            builder: (context) => SignInScreen(
                  datos: args as Map<String, dynamic>,
                ));
      case '/my_designs_screen':
        return MaterialPageRoute(builder: (context) => MyDesignsScreen());

      default:
        return MaterialPageRoute(builder: (context) => const ErrorScreen());
    }
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Error Route'),
      ),
    );
  }
}
