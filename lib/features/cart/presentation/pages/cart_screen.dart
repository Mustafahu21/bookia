import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/extentions/dialoges.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  double calculateTotalPrice(List<dynamic> items) {
    return items.fold(
      0.0,
      (sum, item) =>
          sum +
          (double.tryParse(item.itemProductPrice ?? '0') ?? 0) *
              (item.itemQuantity ?? 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..showCart(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('List Title', style: TextStyles.getBody(fontSize: 28)),
          centerTitle: true,
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            var cubit = context.read<CartCubit>();
            if (state is CartLoadingState) {
              return Center(child: getLoadingWidget());
            }
            if (state is CartErrorState) {
              return Center(child: Text(state.message));
            }
            if (cubit.cartItems.isEmpty) {
              return const Center(child: Text('Cart is empty'));
            }
            final cartItems = cubit.cartItems;
            final totalprice = calculateTotalPrice(cartItems);
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          ListView.separated(
                            itemBuilder: (context, index) {
                              return CartCard(products: cubit.cartItems[index]);
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                indent: 15,
                                endIndent: 15,
                                color: Color.fromARGB(32, 131, 145, 161),
                              );
                            },
                            itemCount:
                                cubit.cartItems.length, // Demo item count
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 144,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyles.getBody(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightGrayColor,
                            ),
                          ),
                          const SizedBox(width: 180),
                          Text(
                            '\$${totalprice.toStringAsFixed(2)}',
                            style: TextStyles.getBody(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      MainButton(
                        height: 60,
                        width: double.infinity,
                        text: 'Checkout',
                        onPressed: () {},
                        backgroundColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
