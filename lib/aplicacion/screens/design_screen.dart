import 'package:clothex_app/aplicacion/screens/select_color_screen.dart';
import 'package:clothex_app/aplicacion/screens/select_material_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DesignScreen extends StatefulWidget {
  DesignScreen({super.key, required this.datos});

  Map<String, dynamic> datos;

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  final _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  Color primaryColor = Colors.white;

  void onDataChanged(Map<String, dynamic> nuevosDatos) {
    primaryColor = nuevosDatos['color'];
    setState(() => widget.datos = nuevosDatos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 10,
        shadowColor: Colors.black,
        iconTheme: const IconThemeData().copyWith(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.grey,
                ],
              ),
            ),
            height: MediaQuery.of(context).size.height / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) - 10,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        primaryColor.withOpacity(0.5), BlendMode.srcATop),
                    child: widget.datos['img_front'],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) - 10,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        primaryColor.withOpacity(0.5), BlendMode.srcATop),
                    child: widget.datos['img_back'],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          style: IconButton.styleFrom(
                            foregroundColor:
                                currentIndex == 0 ? Colors.white : Colors.black,
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                      Text(
                        '',
                        style: const TextStyle().copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios_rounded)),
                    ],
                  ),
                ),
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  children: [
                    MaterialScreen(
                        datos: widget.datos, onDataChange: onDataChanged),
                    SelectColorScreen(
                        datos: widget.datos, onDataChange: onDataChanged),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
