import 'package:clothex_app/aplicacion/Widgets/clothex_bottom_bar.dart';
import 'package:clothex_app/aplicacion/screens/in_progress_screen.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Clothex App',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.green[800],
            indicatorColor: Colors.green[800],
            isScrollable: true,
            tabs: const [
              Tab(text: 'Inspírate'),
              Tab(text: 'Diseños de expertos'),
              Tab(text: 'Siguiendo'),
            ],
          ),
        ),
        body: const InProgress(),
        bottomNavigationBar: const ClothexBottomBar(),
      ),
    );
  }
}
