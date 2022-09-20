import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/app/modules/home/controllers/home_controller.dart';

class Rating extends StatelessWidget {
  Rating({
    super.key,
    required this.rating,
  });

  HomeController c = Get.put(HomeController());

  final String rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, color: Colors.yellow),
        Text(rating),
      ],
    );
  }
}
