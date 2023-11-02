import 'package:clothex_app/aplicacion/screens/home_screen.dart';
import 'package:clothex_app/aplicacion/widgets/shared_login_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
                child: Padding(
      padding: EdgeInsets.fromLTRB(
          20, MediaQuery.of(context).size.height * 0.2, 20, 0),
      child: Column(children: <Widget>[
        logoWidget("assets/Images/clothex_logo.jpg"),
        const SizedBox(
          height: 30,
        ),
        reusableTextField("Enter Username", Icons.person_outline, false,
            _userNameTextController),
        const SizedBox(
          height: 20,
        ),
        reusableTextField(
            "Enter email", Icons.person_outline, false, _emailTextController),
        const SizedBox(
          height: 20,
        ),
        reusableTextField("Enter Password", Icons.lock_outline, true,
            _passwordTextController),
        const SizedBox(
          height: 5,
        ),
        firebaseUIButton(context, "Sign Up", () {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text)
              .then((value) {
            print("Created New Account");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }).onError((error, stackTrace) {
            print("Error ${error.toString()}");
          });
        })
      ]),
    ))));
  }
}
