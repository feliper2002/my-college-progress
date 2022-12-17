import 'package:flutter/material.dart';

class CustomTabBarItem extends StatelessWidget {
  final String title;
  final int index;
  final Color? selectedColor;
  const CustomTabBarItem({
    super.key,
    required this.title,
    required this.index,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    Color selectedColorBg;

    if (selectedColor != null) {
      selectedColorBg = selectedColor!;
    } else {
      selectedColorBg = Colors.deepPurpleAccent[100]!;
    }

    return Container(
        height: 34,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(bottom: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedColorBg,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: (selectedColor == Colors.white)
                ? Colors.deepPurpleAccent
                : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
