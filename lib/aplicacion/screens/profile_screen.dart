import 'package:clothex_app/aplicacion/widgets/shared_login_widgets.dart';
import 'package:clothex_app/infraestructura/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getInfo(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Perfil'),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      // Navega a la ruta '/home_screen' cuando se presiona el botón de retroceso
                      Navigator.of(context).pushNamed('/home_screen');
                    },
                  ),
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/Images/profile_icon.png",
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          child: reusableTextField2(
                              snapshot.data?[0]['email'],
                              Icons.alternate_email,
                              false,
                              _emailTextController)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          child: reusableTextField2(
                              snapshot.data?[0]['username'],
                              Icons.people_alt,
                              false,
                              _emailTextController)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          child: reusableTextField2(
                              snapshot.data?[0]['password'],
                              Icons.lock_open,
                              false,
                              _emailTextController)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            setState(() {});
                            Navigator.of(context).pushNamed('/home_screen');
                          },
                          child: Text('Log Out',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ))),
                    ),
                  ],
                ));
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        }));
  }
}
