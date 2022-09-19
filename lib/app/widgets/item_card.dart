import 'package:flutter/material.dart';
import 'package:testapp/app/widgets/widget.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
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
                    const Text(
                      '109.95',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Image
                    Expanded(
                      child: Image.network(
                          "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: const [
                        // Title
                        Text(
                          "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Description
                        Text(
                          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                        // Rating
                        Align(
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
