import 'package:clothex_app/aplicacion/screens/home_screen.dart';
import 'package:clothex_app/aplicacion/screens/signup_screen.dart';
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
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
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
        firebaseUIButton(context, "Sign In", () {
          FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text)
              .then((value) {
            final id = value.user!.uid;
            if (widget.datos != null) {
              addDesign(widget.datos!, id);
            }
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }).onError((error, stackTrace) {
            print("Error ${error.toString()}");
          });
        }),
        signUpOption()
      ]),
    ))));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignUpScreen(
                          datos: widget.datos,
                        )));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
