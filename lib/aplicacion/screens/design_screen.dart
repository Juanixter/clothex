import 'package:clothex_app/aplicacion/screens/select_color_screen.dart';
import 'package:clothex_app/aplicacion/screens/select_material_screen.dart';
import 'package:clothex_app/aplicacion/screens/text.dart';
import 'package:clothex_app/dominio/prendas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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

  void onDataChanged(Map<String, dynamic> nuevosDatos) {
    setState(() => widget.datos = nuevosDatos);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String textZone(String to) {
    if (widget.datos['texto']['zona'] == to) {
      return widget.datos['texto']['string'];
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final double fontSize = widget.datos['texto']['size'].toDouble();
    Widget layoutType;
    double heightRatio;
    if (kIsWeb) {
      heightRatio = 0.12;
      layoutType = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    style: IconButton.styleFrom(
                      foregroundColor:
                          currentIndex == 0 ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      if (currentIndex != 0) {
                        _pageController.animateToPage(currentIndex - 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      }
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                Text(
                  '',
                  style: const TextStyle()
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    style: IconButton.styleFrom(
                      foregroundColor:
                          currentIndex == 2 ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      if (currentIndex != 2) {
                        _pageController.animateToPage(currentIndex + 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      }
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded)),
              ],
            ),
          ),
          Expanded(
            child: PageView(
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
                if (tiposDePrenda.contains(widget.datos['tipo']))
                  TextPage(datos: widget.datos, onDataChange: onDataChanged)
              ],
            ),
          ),
        ],
      );
    } else {
      heightRatio = 0.05;
      layoutType = Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    style: IconButton.styleFrom(
                      foregroundColor:
                          currentIndex == 0 ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      if (currentIndex > 0) {
                        _pageController.animateToPage(currentIndex - 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      }
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                Text(
                  '',
                  style: const TextStyle()
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    style: IconButton.styleFrom(
                      foregroundColor:
                          currentIndex == 2 ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      if (currentIndex < 2) {
                        _pageController.animateToPage(currentIndex + 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      }
                    },
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
              MaterialScreen(datos: widget.datos, onDataChange: onDataChanged),
              SelectColorScreen(
                  datos: widget.datos, onDataChange: onDataChanged),
              if (tiposDePrenda.contains(widget.datos['tipo']))
                TextPage(datos: widget.datos, onDataChange: onDataChanged)
            ],
          ),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.white,
          elevation: 10,
          // leading: GestureDetector(
          //   onTap: () {
          //     if (Navigator.canPop(context)) {
          //       Navigator.of(context).pop();
          //     } else {
          //       Navigator.of(context).pushReplacementNamed('/home_screen');
          //     }
          //   },
          //   child: const Icon(Icons.arrow_back),
          // )),
          title: const Text('Salir'),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home_screen');
              },
              icon: const Icon(Icons.arrow_back))),
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
                    child: Stack(
                        fit: StackFit.loose,
                        alignment: Alignment.center,
                        children: <Widget>[
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                widget.datos['color'].withOpacity(0.5),
                                BlendMode.srcATop),
                            child: widget.datos['img_front'],
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height *
                                heightRatio,
                            child: SizedBox(
                              height: 40,
                              width: 120,
                              //color: Colors.red,
                              child: DefaultTextStyle.merge(
                                style: TextStyle(
                                  //fontSize: 18,
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                                child: Center(
                                  child: Text(textZone("Frente")),
                                ),
                              ),
                            ),
                          ),
                        ])),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Stack(
                        fit: StackFit.loose,
                        alignment: Alignment.center,
                        children: <Widget>[
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                widget.datos['color'].withOpacity(0.5),
                                BlendMode.srcATop),
                            child: widget.datos['img_back'],
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height *
                                heightRatio,
                            child: SizedBox(
                              height: 40,
                              width: 150,
                              //color: Colors.red,
                              child: DefaultTextStyle.merge(
                                style: TextStyle(
                                  //fontSize: 18,
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                                child:
                                    Center(child: Text(textZone("Posterior"))),
                              ),
                            ),
                          ),
                        ])),
              ],
            ),
          ),
          Expanded(
            child: layoutType,
          ),
        ],
      ),
    );
  }
}
