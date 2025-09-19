import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/home/data/models/product_list_response/product.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        color: AppColors.lightPrimary,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.image ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 30,
              child: Text(
                product.name ?? '',
                style: TextStyles.getBody(
                  color: AppColors.darkColor,
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${product.price}\$',
                  style: TextStyles.getBody(
                    color: AppColors.darkColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MainButton(
                  text: 'Buy',
                  onPressed: () {},
                  width: 30,
                  height: 30,
                  backgroundColor: AppColors.darkColor,
                  textStyle: TextStyles.getBody(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                  radius: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
