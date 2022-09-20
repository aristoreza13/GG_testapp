import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/app/data/item_model.dart';

class Controller extends GetxController {
  var itemList = <ItemModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchItem();
  }

  Future<void> fetchItem() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      ItemModel _itemModel = ItemModel.fromJson(
        jsonDecode(response.body),
      );

      itemList.add(
        ItemModel(
          id: _itemModel.id,
          title: _itemModel.title,
          price: _itemModel.price,
          description: _itemModel.description,
          category: _itemModel.category,
          image: _itemModel.image,
          rating: _itemModel.rating,
        ),
      );

      isLoading.value = true;
    } else {
      Get.snackbar("Error loading data!",
          "Server respond: ${response.statusCode}:${response.reasonPhrase.toString()}");
    }
  }
}
