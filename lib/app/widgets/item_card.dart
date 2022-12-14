import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/app/controllers/controller.dart';
import 'package:testapp/app/modules/home/controllers/home_controller.dart';
import 'package:testapp/app/widgets/widget.dart';

class ItemCard extends StatelessWidget {
  ItemCard({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
  });

  final int id;
  final String image;
  final String title;
  final String description;
  final String rating;
  final num price;

  final c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        onLongPress: () {
          debugPrint('Delete item tapped');
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Warning"),
                content: const Text("Are you sure want to delete item?"),
                actions: [
                  TextButton(
                    child: const Text("Yes"),
                    onPressed: () {
                      Controller().deleteItem(id);
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: const Text("No"),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 700,
            height: 150,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Price
                    Text(
                      price.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Image
                    Expanded(
                      child: Image.network(
                        image,
                        fit: BoxFit.fill,
                        width: 100,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title
                        Text(
                          title,
                          maxLines: 2,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Description
                        Flexible(
                          child: Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                        // Rating
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Rating(
                            rating: rating,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
