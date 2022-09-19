import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  // Fetch all data to contact
  Future<List<dynamic>> fetchData() async {
    var result = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    return json.decode(result.body);
  }
}
