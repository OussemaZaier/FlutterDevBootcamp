import 'package:flutter/material.dart';

class icon_content extends StatelessWidget {
  const icon_content({required this.iconD, required this.titleD});
  final String titleD;
  final IconData iconD;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconD,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          titleD,
          style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
