import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ClothexBottomBar extends StatefulWidget {
  const ClothexBottomBar(this.index, {super.key});

  final int index;

  @override
  State<ClothexBottomBar> createState() {
    return _ClothexBottomBarState();
  }
}

class _ClothexBottomBarState extends State<ClothexBottomBar> {
  void onTabPressed(index) {
    if (index == 0) {
      Navigator.of(context).pushReplacementNamed('/home_screen');
    } else if (index == 1) {
      Navigator.of(context).pushReplacementNamed('/select_clothe_type');
    } else if (index == 2) {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.of(context).pushReplacementNamed('/my_designs_screen');
      } else {
        Navigator.of(context).pushReplacementNamed('/no_designs_screen');
      }
    } else if (index == 3) {
      Navigator.of(context).pushReplacementNamed('/designer_screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green[800],
      unselectedItemColor: Colors.black,
      currentIndex: widget.index,
      onTap: onTabPressed,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 40,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline_sharp,
              size: 50,
            ),
            label: 'Create Design'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 40,
            ),
            label: 'My Designs'),
        BottomNavigationBarItem(
            icon: Icon(Icons.palette, size: 40), label: 'Designers Screen')
      ],
    );
  }
}
