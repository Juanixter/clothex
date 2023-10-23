import 'package:clothex_app/dominio/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Clothex App',
      themeMode: ThemeMode.system,
      initialRoute: '/select_color',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
