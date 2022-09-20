import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testapp/app/routes/app_pages.dart';
import 'package:testapp/app/widgets/widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
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
        future: c.fetchData(),
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
                return ItemCard(
                  image: snapshot.data[index]['image'],
                  title: snapshot.data[index]['title'],
                  description: snapshot.data[index]['description'],
                  price: snapshot.data[index]['price'],
                  rating: snapshot.data[index]['rating']['rate'].toString(),
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
