import 'package:clothex_app/aplicacion/widgets/dots_indicator.dart';
import 'package:clothex_app/dominio/design.dart';
import 'package:clothex_app/dominio/prices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

// ignore: must_be_immutable
class DesignDetailsScreen extends StatefulWidget {
  DesignDetailsScreen({
    super.key,
    required this.design,
  });

  final Design design;

  final Color selectedColor = Colors.black.withOpacity(0.7);

  final Color unselectedColor = Colors.white;

  @override
  State<DesignDetailsScreen> createState() => _DesignDetailsScreenState();
}

class _DesignDetailsScreenState extends State<DesignDetailsScreen> {
  final _imageController = PageController(initialPage: 0);
  int currentIndex = 0;
  int currentCuantity = 1;

  String get materialString {
    String removeText = widget.design.material.replaceAll('Text(', '');
    String removeParenthesis = removeText.replaceAll(')', '');
    String material = removeParenthesis.replaceAll('"', '');
    return material;
  }

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Color color = Color(widget.design.color).withOpacity(0.6);

    double cost = prices[materialString] as double;
    if (widget.design.texto != '') {
      cost += 5;
    }

    double wholeCost = cost * currentCuantity;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: SizedBox(
                height: (height / 2) - 10,
                width: width - 20,
                child: PageView(
                  controller: _imageController,
                  onPageChanged: (value) {
                    currentIndex = value;
                    setState(() {});
                  },
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
                      child: Image.network(
                        widget.design.urlFront,
                        fit: BoxFit.contain,
                      ),
                    ),
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
                      child: Image.network(
                        widget.design.urlBack,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DotsIndicator(
                width: width, currentIndex: currentIndex, widget: widget),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.design.titulo,
                style: const TextStyle().copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: width - 40,
              height: 100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Text('Tipo de prenda: ${widget.design.tipo}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 15,
                    ),
                    child: Text('fecha de creación: ${widget.design.fecha}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 15,
                    ),
                    child: Row(
                      children: [
                        Text('Talla: ${widget.design.talla}'),
                        const SizedBox(
                          width: 20,
                        ),
                        Text('Material: $materialString'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: BorderSide.none,
                        textStyle: const TextStyle().copyWith(
                          fontSize: 40,
                        ),
                      ),
                      onPressed: () {
                        if (currentCuantity > 1) {
                          currentCuantity--;
                          setState(() {});
                        }
                      },
                      child: const Text('-')),
                  Text('$currentCuantity'),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: BorderSide.none,
                        textStyle: const TextStyle().copyWith(
                          fontSize: 40,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          currentCuantity++;
                        });
                      },
                      child: const Text('+')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Costo: ${wholeCost.toStringAsFixed(2)} \$'),
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PaypalCheckout(
                      sandboxMode: true,
                      clientId:
                          "AQbPrAZz95h7k4YRtzj3-g5r0bsFAWvMKtMD99Qelp4T17NhbuDnV-rm6b6NiqlACCznaCoGicMjaSde",
                      secretKey:
                          "EH-fmJ_HcDlFw70MeAICZx_2P7QUYLYHIa0OIyFVGHrmE9F58S14nDkIjgLf4_7bSGwdh1thv1r9COLp",
                      returnURL: "success.snippetcoder.com",
                      cancelURL: "cancel.snippetcoder.com",
                      transactions: [
                        {
                          "amount": {
                            "total": '$wholeCost',
                            "currency": "USD",
                            "details": {
                              "subtotal": '$wholeCost',
                              "shipping": '0',
                              "shipping_discount": 0
                            }
                          },
                          "description":
                              "Monto correspondiente a la compra de $currentCuantity prendas.",
                          // "payment_options": {
                          //   "allowed_payment_method":
                          //       "INSTANT_FUNDING_SOURCE"
                          // },
                          "item_list": {
                            "items": [
                              {
                                "name": widget.design.tipo,
                                "quantity": currentCuantity,
                                "price": '$cost',
                                "currency": "USD"
                              }
                            ],
                          }
                        }
                      ],
                      note:
                          "Contactenos en caso de cualquier conflicto con su orden.",
                      onSuccess: (Map params) async {
                        print("onSuccess: $params");
                      },
                      onError: (error) {
                        print("onError: $error");
                        Navigator.pop(context);
                      },
                      onCancel: () {
                        print('cancelled:');
                      },
                    ),
                  ));
                },
                child: Text(
                  'Realizar compra',
                  style: const TextStyle().copyWith(
                    color: Colors.black,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
