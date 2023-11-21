import 'package:clothex_app/aplicacion/screens/design_details_screen.dart';
import 'package:clothex_app/aplicacion/screens/design_screen.dart';
import 'package:clothex_app/aplicacion/screens/checkout_screen.dart';
import 'package:clothex_app/aplicacion/screens/designerDetailScreen.dart';
import 'package:clothex_app/aplicacion/screens/home_screen.dart';
import 'package:clothex_app/aplicacion/screens/clothe_type.dart';
import 'package:clothex_app/aplicacion/screens/mydesings_screen.dart';
import 'package:clothex_app/dominio/design.dart';
import 'package:clothex_app/aplicacion/screens/screen_designers.dart';
import 'package:clothex_app/aplicacion/screens/profile_screen.dart';

import 'package:clothex_app/aplicacion/screens/signin_screen.dart';
import 'package:clothex_app/aplicacion/screens/no_designs_screen.dart';
import 'package:flutter/material.dart';
import 'package:clothex_app/dominio/designers.dart';

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
      case '/designer_screen':
        return MaterialPageRoute(builder: (context) => DesignersScreen());
      case '/signin_screen':
        if (args != null) {
          return MaterialPageRoute(
              builder: (context) => SignInScreen(
                    datos: args as Map<String, dynamic>,
                  ));
        } else {
          return MaterialPageRoute(builder: (context) => SignInScreen());
        }
      case '/my_designs_screen':
        return MaterialPageRoute(builder: (context) => const MyDesignsScreen());
      case '/designers_detail_screen':
        if (args != null) {
          return MaterialPageRoute(
              builder: (context) => DesignerDetailsScreen(
                    design: args as Designers,
                  ));
        } else {
          return MaterialPageRoute(builder: (context) => const ErrorScreen());
        }
      case '/no_designs_screen':
        return MaterialPageRoute(builder: (context) => const NoDesignsScreen());

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
