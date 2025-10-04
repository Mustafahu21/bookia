import 'package:bookia/core/extentions/dialoges.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print((LocalHelper.getUserData()?.token ?? 'some_token'));
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishList(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wishlist', style: TextStyles.getBody(fontSize: 28)),
          centerTitle: true,
        ),
        body: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) {
            var cubit = context.read<WishlistCubit>();
            if (state is WishlistLoading) {
              return Center(child: getLoadingWidget());
            } else if (state is WishlistError) {
              return Center(child: Text(state.message));
            } else if (state is WishlistLoaded &&
                context.read<WishlistCubit>().wishlist.isEmpty) {
              return Center(child: Text('Your wishlist is empty'));
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    ListView.separated(
                      itemBuilder: (context, index) {
                        return WishlistCard(
                          products: cubit.wishlist[index],
                          onDelete: () {
                            cubit.removeFromWishlist(cubit.wishlist[index].id);
                          },
                        );
                      },
                      itemCount: cubit.wishlist.length,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          indent: 15,
                          endIndent: 15,
                          color: Color.fromARGB(32, 131, 145, 161),
                        );
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
