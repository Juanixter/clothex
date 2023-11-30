import 'package:clothex_app/aplicacion/widgets/shared_login_widgets.dart';
import 'package:clothex_app/infraestructura/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignInScreen extends StatefulWidget {
  SignInScreen({super.key, this.datos});

  Map<String, dynamic>? datos;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  Future<int> designNumber() async {
    List designs = await getDesigns();
    int designsLength = designs.length;
    return designsLength + 1;
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
        reusableTextField(
            "Ingresa email", Icons.person_outline, false, _emailTextController),
        const SizedBox(
          height: 20,
        ),
        reusableTextField("Ingresa Contraseña", Icons.lock_outline, true,
            _passwordTextController),
        const SizedBox(
          height: 5,
        ),
        firebaseUIButton(context, "Iniciar Sesión!", () async {
          if (FirebaseAuth.instance.currentUser == null) {
            FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text)
                .then((value) async {
              final id = value.user!.uid;
              if (widget.datos != null) {
                await designNumber().then(
                  (value) {
                    String titulo = 'Diseño $value';
                    widget.datos?['titulo'] = titulo;
                  },
                );
                addDesign(widget.datos!, id);
              }
              Navigator.of(context).pushNamed('/home_screen');
            }).onError((error, stackTrace) {
              print("Error ${error.toString()}");
            });
          } else {
            Navigator.of(context).pushNamed('/home_screen');
          }
        }),
        signUpOption()
      ]),
    )));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("No tienes una cuenta?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/signup_screen',
                arguments: widget.datos);
          },
          child: const Text(
            " Regístrate aquí",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
