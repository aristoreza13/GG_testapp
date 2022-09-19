import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/app/widgets/widget.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    // required this.rating,
  });

  final String image;
  final String title;
  final String description;
  // final String rating;
  final num price;

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
            builder: (BuildContext context) => Dialog(
              child: Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Delete'),
                    onTap: () {
                      debugPrint('Deleted');
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 300,
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
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
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
                        Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        // Rating
                        const Align(
                            alignment: Alignment.bottomRight, child: Rating()),
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
