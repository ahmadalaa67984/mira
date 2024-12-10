import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mira/packages/component_library/component_library.dart';
import 'package:mira/packages/mira_api/models/productes/hot_deals_productes.dart';

class SharedItemCard extends StatelessWidget {
  final Product product;

  const SharedItemCard({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = MiraTheme.of(context);
    return   Container(
      width: 120, // Fixed width for each item
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Stack(
                children: [
                  Center(
                    child: Image.network(
                      product.imageUrl,
                      height: 120,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child:Container(
                      child:
                      Icon(
                          Icons.add,
                          color: Colors.white, // Icon color
                          size: 24
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.primaryColor,
                      ),
                    ) ,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              '${product.price.toStringAsFixed(2)}EGP',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
