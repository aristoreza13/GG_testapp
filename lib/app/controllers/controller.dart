import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' show Client;
import 'package:testapp/app/data/item_model.dart';

class Controller extends GetxController {
  final baseUrl = Uri.parse("https://fakestoreapi.com/products");
  Client client = Client();
  TextEditingController titleController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  Future<List<ItemModel>?> getItem() async {
    final response = await client.get(baseUrl);
    if (response.statusCode == 200) {
      return itemModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<String?> getDetailItem(int id) async {
    final response = await client.get(baseUrl);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<bool> deleteItem(int id) async {
    final response = await client.delete(
      baseUrl,
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createItem(ItemModel item) async {
    final response = await client.post(
      baseUrl,
      headers: {"content-type": "application/json"},
      body: itemModelToJson(item),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  void addItem() async {
    int id = int.parse(idController.text);
    String title = titleController.text.toString();
    double price = double.parse(priceController.text);
    String description = descController.text.toString();
    String category = categoryController.text.toString();
    String image = imageController.text.toString();
    Rating rating = ratingController.text.toString() as Rating;

    ItemModel itemModel = ItemModel(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: rating,
    );
    Controller().createItem(itemModel).then((value) => Get.back());
  }
}
