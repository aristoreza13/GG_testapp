import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddItemController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  final url = Uri.parse("https://fakestoreapi.com/products");

  Future<bool> createItem() async {
    final response = await http.post(
      url,
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
  }
}
