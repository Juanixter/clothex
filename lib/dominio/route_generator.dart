import 'package:clothex_app/aplicacion/screens/home_screen.dart';
import 'package:clothex_app/aplicacion/screens/clothe_type.dart';
import 'package:clothex_app/aplicacion/screens/pattern_screen.dart';
import 'package:clothex_app/aplicacion/screens/select_material_screen.dart';
import 'package:clothex_app/aplicacion/screens/select_pattern_screen.dart';
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
      case '/select_material_screen':
        return MaterialPageRoute(builder: (context) => const MaterialScreen());
      case '/select_pattern_screen':
        return MaterialPageRoute(builder: (context) => const PatternScreen());

      case '/_pattern_screen':
        return MaterialPageRoute(builder: (context) => SelectPatternScreen());

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
