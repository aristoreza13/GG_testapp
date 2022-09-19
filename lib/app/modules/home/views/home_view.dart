import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testapp/app/widgets/widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          ItemCard(id: "1"),
          SizedBox(
            height: 10,
          ),
          ItemCard(id: "2"),
          SizedBox(
            height: 10,
          ),
          ItemCard(id: "3"),
        ],
      ),
    );
  }
}
