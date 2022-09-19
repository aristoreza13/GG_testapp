import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.star, color: Colors.yellow),
        Text('4.8'),
      ],
    );
  }
}
