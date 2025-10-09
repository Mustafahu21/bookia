import 'package:bookia/core/constants/asset_names.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.products});

  final CartItem products;

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
                    products.itemProductImage ?? '',
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
                            products.itemProductName ?? 'Book Title',
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
                            context.read<CartCubit>().removeFromCart(
                              itemId: products.itemId,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '\$${products.itemProductPrice ?? '0'}',
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<CartCubit>().updateCart(
                              productId: products.itemId,
                              quantity: (products.itemQuantity ?? 1) + 1,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: const Color.fromARGB(
                              255,
                              193,
                              204,
                              218,
                            ),
                            padding: EdgeInsets.all(5),
                            minimumSize: Size(40, 40),
                          ),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                        SizedBox(width: 20),
                        Text(
                          products.itemQuantity.toString(),
                          style: TextStyles.getBody(
                            fontSize: 20,
                            color: AppColors.darkColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (products.itemQuantity == 1) return;
                            context.read<CartCubit>().updateCart(
                              productId: products.itemId!,
                              quantity: (products.itemQuantity ?? 1) - 1,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: Color.fromARGB(255, 193, 204, 218),
                            padding: EdgeInsets.all(5),
                            minimumSize: Size(40, 40),
                          ),
                          child: Icon(Icons.remove, color: Colors.white),
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
