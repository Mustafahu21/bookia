import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/constants/asset_names.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/wishlist/data/model/wishlist_response/datum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({
    super.key,
    required this.products,
    required this.onDelete,
    required this.add2Cart,
  });

  final Datum products;
  final Function() onDelete;
  final Function() add2Cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 171,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Image.network(
                    products.image ?? '',
                    height: 140,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            products.name ?? 'Book Title',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGrey,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            AssetNames.cancel,
                            width: 30,
                            height: 30,
                          ),
                          onPressed: () {
                            onDelete();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '\$${products.price ?? '0'}',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.darkColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MainButton(
                          text: 'Add to Cart',
                          onPressed: () {
                            add2Cart();
                          },
                          height: 50,
                          width: 200,
                          backgroundColor: AppColors.primaryColor,
                          textStyle: TextStyles.getBody(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
