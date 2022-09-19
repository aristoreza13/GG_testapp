import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testapp/app/routes/app_pages.dart';

import '../controllers/add_item_controller.dart';

class AddItemView extends GetView<AddItemController> {
  const AddItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddItemView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const TextField(
            autocorrect: false,
            // // controller: controller.nameC,
            // maxLength: 16,
            decoration: InputDecoration(
              labelText: "ID",
              icon: Icon(Icons.numbers),
            ),
          ),
          const TextField(
            autocorrect: false,
            // controller: controller.nameC,
            decoration: InputDecoration(
              labelText: "Item",
              icon: Icon(CupertinoIcons.cube),
            ),
          ),
          const TextField(
            autocorrect: false,
            // controller: controller.nameC,
            decoration: InputDecoration(
              labelText: "Price",
              icon: Icon(CupertinoIcons.money_dollar),
            ),
          ),
          const TextField(
            autocorrect: false,
            // controller: controller.nameC,
            decoration: InputDecoration(
              labelText: "Description",
              icon: Icon(Icons.web),
            ),
          ),
          const TextField(
            autocorrect: false,
            // controller: controller.nameC,
            decoration: InputDecoration(
              labelText: "Category",
              icon: Icon(Icons.list),
            ),
          ),
          const TextField(
            autocorrect: false,
            // controller: controller.nameC,
            decoration: InputDecoration(
              labelText: "Image",
              icon: Icon(Icons.image),
            ),
          ),
          const TextField(
            autocorrect: false,
            // controller: controller.nameC,
            decoration: InputDecoration(
              labelText: "Rating",
              icon: Icon(Icons.rate_review),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.HOME),
              child: const Text('Add Item')),
        ],
      ),
    );
  }
}
