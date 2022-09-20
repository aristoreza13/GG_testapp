import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testapp/app/controllers/controller.dart';
import 'package:testapp/app/data/item_model.dart';
import 'package:testapp/app/routes/app_pages.dart';

import '../controllers/add_item_controller.dart';

class AddItemView extends GetView<AddItemController> {
  AddItemView({Key? key}) : super(key: key);

  final c = Get.put(Controller());
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
          TextField(
            autocorrect: false,
            controller: c.idController,
            // maxLength: 16,
            decoration: const InputDecoration(
              labelText: "ID",
              icon: Icon(Icons.numbers),
            ),
          ),
          TextField(
            autocorrect: false,
            controller: c.titleController,
            decoration: const InputDecoration(
              labelText: "Item",
              icon: Icon(CupertinoIcons.cube),
            ),
          ),
          TextField(
            autocorrect: false,
            controller: c.priceController,
            decoration: const InputDecoration(
              labelText: "Price",
              icon: Icon(CupertinoIcons.money_dollar),
            ),
          ),
          TextField(
            autocorrect: false,
            controller: c.descController,
            decoration: const InputDecoration(
              labelText: "Description",
              icon: Icon(Icons.web),
            ),
          ),
          TextField(
            autocorrect: false,
            controller: c.categoryController,
            decoration: const InputDecoration(
              labelText: "Category",
              icon: Icon(Icons.list),
            ),
          ),
          TextField(
            autocorrect: false,
            controller: c.imageController,
            decoration: const InputDecoration(
              labelText: "Image",
              icon: Icon(Icons.image),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                // c.createItem();
                Controller().addItem();
                Get.offAllNamed(Routes.HOME);
              },
              child: const Text('Add Item')),
        ],
      ),
    );
  }
}
