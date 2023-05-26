import 'package:flutter/material.dart';

class reusable_card extends StatelessWidget {
  const reusable_card(
      {required this.childW, required this.onTapFct, required this.bgColor});
  final VoidCallback onTapFct;
  final Widget childW;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFct,
      child: Container(
        child: childW,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
