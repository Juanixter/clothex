import 'package:flutter/material.dart';

class ClothexBottomBar extends StatefulWidget {
  const ClothexBottomBar({super.key});

  @override
  State<ClothexBottomBar> createState() {
    return _ClothexBottomBarState();
  }
}

class _ClothexBottomBarState extends State<ClothexBottomBar> {
  int currentIndex = 0;

  void onTabPressed(index) {
    if (index == 1) {
      Navigator.of(context).pushNamed('/select_clothe_type');
      return;
    }

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green[800],
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
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
              color: Colors.black,
            ),
            label: 'Create Design'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.design_services,
              size: 40,
            ),
            label: 'My Designs'),
      ],
    );
  }
}
