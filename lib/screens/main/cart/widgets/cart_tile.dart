import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:ar_visionary_explora/screens/main/myhome/items.dart';
import 'package:ar_visionary_explora/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final Items item;
  final Function(Items) onRemove;

  const CartTile({
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(item.itemImage ?? ''),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    item.itemName ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  // Product Price
                  Text(
                    '\$${item.itemPrice ?? "0"}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 2),
                  // Product Description
                  Text(
                    item.itemDescription ?? '',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            // Remove Button
            IconButton(
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              onPressed: () => onRemove(item),
            ),
          ],
        ),
      ),
    );
  }
}
