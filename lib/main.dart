import 'package:clothex_app/dominio/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothex App',
      themeMode: ThemeMode.system,
      theme: ThemeData().copyWith(
        useMaterial3: true,
      ),
      initialRoute: '/home_screen',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
