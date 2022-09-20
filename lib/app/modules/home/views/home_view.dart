import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testapp/app/controllers/controller.dart';
import 'package:testapp/app/data/item_model.dart';
import 'package:testapp/app/routes/app_pages.dart';
import 'package:testapp/app/widgets/widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Barang'),
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
      body: FutureBuilder(
        future: Controller().getItem(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                ItemModel items = snapshot.data[index];
                return ItemCard(
                  id: items.id,
                  image: items.image,
                  title: items.title,
                  description: items.description,
                  price: items.price,
                  rating: items.rating.rate.toString(),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
