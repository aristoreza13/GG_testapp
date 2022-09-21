import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' show Client;
import 'package:testapp/app/data/item_model.dart';

class Controller extends GetxController {
  final baseUrl = Uri.parse("https://fakestoreapi.com/products");
  Client client = Client();

  Future<List<ItemModel>?> getItem() async {
    final response = await client.get(baseUrl);
    if (response.statusCode == 200) {
      return itemModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<ItemModel> getDetailItem(int id) async {
    final response =
        await client.get(Uri.parse("https://fakestoreapi.com/products/$id"));
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load item');
    }
  }

  Future<void> deleteItem(int id) async {
    final response = await client.delete(
      Uri.parse("https://fakestoreapi.com/products/$id"),
    );
    if (response.statusCode == 200) {
      print("Item deleted");
    } else {
      throw "Failed to delete item";
    }
  }

  Future<ItemModel> createItem(ItemModel itemModel) async {
    Map data = {
      'id': itemModel.id,
      'title': itemModel.title,
      'price': itemModel.price,
      'description': itemModel.description,
      'category': itemModel.category,
      'image': itemModel.image,
      'rating': itemModel.rating,
    };

    final response = await client.post(
      baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post item');
    }
  }
}
