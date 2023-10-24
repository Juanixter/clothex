import 'package:clothex_app/aplicacion/screens/home_screen.dart';
import 'package:clothex_app/aplicacion/screens/clothe_type.dart';
import 'package:clothex_app/aplicacion/screens/select_color_screen.dart';
import 'package:clothex_app/aplicacion/screens/select_material_screen.dart';
import 'package:clothex_app/aplicacion/screens/text.dart';
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
        return MaterialPageRoute(
            builder: (context) => MaterialScreen(datos: args));
      case '/select_color':
        return MaterialPageRoute(
            builder: (context) => SelectColorScreen(
                  datos: args,
                ));

      case '/text_page':
        return MaterialPageRoute(builder: (context) => TextPage(datos: args));

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
