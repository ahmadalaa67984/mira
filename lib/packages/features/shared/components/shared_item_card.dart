import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mira/packages/mira_api/models/productes/hot_deals_productes.dart';

class SharedItemCard extends StatelessWidget {
  final Product product;

  const SharedItemCard({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 120, // Fixed width for each item
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.imageUrl,
            height: 120,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
