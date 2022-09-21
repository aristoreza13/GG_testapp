import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testapp/app/controllers/controller.dart';
import 'package:testapp/app/data/item_model.dart';
import 'package:testapp/app/routes/app_pages.dart';

import '../controllers/add_item_controller.dart';

class AddItemView extends GetView<AddItemController> {
  AddItemView({Key? key}) : super(key: key);

  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          TextField(
            autocorrect: false,
            controller: idController,
            // maxLength: 16,
            decoration: const InputDecoration(
              labelText: "ID",
              icon: Icon(Icons.numbers),
            ),
          ),
          TextField(
            autocorrect: false,
            controller: titleController,
            decoration: const InputDecoration(
              labelText: "Item",
              icon: Icon(CupertinoIcons.cube),
            ),
          ),
          TextField(
            autocorrect: false,
            controller: priceController,
            decoration: const InputDecoration(
              labelText: "Price",
              icon: Icon(CupertinoIcons.money_dollar),
            ),
          ),
          TextField(
            autocorrect: false,
            controller: descController,
            decoration: const InputDecoration(
              labelText: "Description",
              icon: Icon(Icons.web),
            ),
          ),
          TextField(
            autocorrect: false,
            controller: categoryController,
            decoration: const InputDecoration(
              labelText: "Category",
              icon: Icon(Icons.list),
            ),
          ),
          TextField(
            autocorrect: false,
            controller: imageController,
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
                Controller().createItem(
                  ItemModel(
                    id: int.parse(idController.text.toString()),
                    title: titleController.text.toString(),
                    price: double.parse(priceController.text.toString()),
                    description: descController.text.toString(),
                    category: categoryController.text.toString(),
                    image: imageController.text.toString(),
                    rating: Rating.fromJson(ratingController.text.toString()
                        as Map<String, dynamic>),
                  ),
                );
                Get.offAllNamed(Routes.HOME);
              },
              child: const Text('Add Item')),
        ],
      ),
    );
  }
}
