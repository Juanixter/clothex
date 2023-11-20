import 'package:clothex_app/aplicacion/screens/design_details_screen.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.width,
    required this.currentIndex,
    required this.widget,
  });

  final double width;
  final int currentIndex;
  final DesignDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.grey[400],
        ),
        width: width / 6,
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == 0
                      ? widget.selectedColor
                      : widget.unselectedColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == 1
                      ? widget.selectedColor
                      : widget.unselectedColor,
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
