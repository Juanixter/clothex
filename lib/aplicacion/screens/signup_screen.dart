import 'package:clothex_app/aplicacion/widgets/shared_login_widgets.dart';
import 'package:clothex_app/infraestructura/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key, this.datos});

  Map<String, dynamic>? datos;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _userNameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: EdgeInsets.fromLTRB(
          20, MediaQuery.of(context).size.height * 0.2, 20, 0),
      child: Column(children: <Widget>[
        logoWidget("assets/Images/clothex_logo.jpg"),
        const SizedBox(
          height: 30,
        ),
        reusableTextField("Ingresa nombre de usuario", Icons.person_outline,
            false, _userNameTextController),
        const SizedBox(
          height: 20,
        ),
        reusableTextField("Ingresa email", Icons.alternate_email, false,
            _emailTextController),
        const SizedBox(
          height: 20,
        ),
        reusableTextField("Ingresa Contraseña", Icons.lock_outline, true,
            _passwordTextController),
        const SizedBox(
          height: 5,
        ),
        firebaseUIButton(context, "Regístrate", () {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text)
              .then((value) {
            final id = value.user!.uid;
            if (widget.datos != null) {
              String titulo = 'Diseño 1';
              widget.datos?['titulo'] = titulo;
              addDesign(widget.datos!, id);
              addInfo(id, _emailTextController.text,
                  _userNameTextController.text, _passwordTextController.text);
            } else {
              addInfo(id, _emailTextController.text,
                  _userNameTextController.text, _passwordTextController.text);
            }
            Navigator.of(context).pushReplacementNamed('/home_screen');
          }).onError((error, stackTrace) {
            print("Error ${error.toString()}");
          });
        })
      ]),
    )));
  }
}
