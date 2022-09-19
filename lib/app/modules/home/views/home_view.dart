import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testapp/app/routes/app_pages.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Add tapped.');
              Get.toNamed(Routes.ADD_ITEM);
            },
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          ItemCard(id: "1"),
          ItemCard(id: "2"),
          ItemCard(id: "3"),
        ],
      ),
    );
  }
}
