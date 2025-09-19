import 'package:bookia/features/home/data/models/product_list_response/product.dart';
import 'package:bookia/features/home/presentaion/widget/book_card.dart';
import 'package:flutter/material.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        return BookCard(product: products[index]);
      },
      itemCount: products.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
