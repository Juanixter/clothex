import 'package:clothex_app/dominio/route_generator.dart';
import 'package:flutter/material.dart';

//firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MaterialApp(
      title: 'Clothex App',
      themeMode: ThemeMode.system,
      initialRoute: '/home_screen',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
