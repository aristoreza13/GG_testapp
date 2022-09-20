import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_item_controller.dart';

class DetailItemView extends GetView<DetailItemController> {
  const DetailItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailItemView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailItemView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
