import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final url = Uri.parse("https://fakestoreapi.com/products");
  // Fetch all data to contact
  Future<List<dynamic>> fetchData() async {
    var result = await http.get(url);
    return json.decode(result.body);
  }

  Future<void> deleteItem(int id) async {
    var response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
