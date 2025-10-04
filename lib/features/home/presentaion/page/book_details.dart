import 'package:bookia/components/app_bar_arrow.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/constants/asset_names.dart';
import 'package:bookia/core/extentions/dialoges.dart';
import 'package:bookia/core/routes/navigators.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/features/home/data/models/product_list_response/product.dart';
import 'package:bookia/features/home/presentaion/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentaion/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({super.key, required this.product});

  final Product product;

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is WishlistCartSuccessState) {
          pop(context);
          showMyDialog(context, state.message, DialogType.success);
        } else if (state is HomeFailureState) {
          pop(context);
          showMyDialog(context, state.error, DialogType.error);
        } else if (state is HomeLoadingState) {
          showLoadingDialog(context);
        }
      },
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return Scaffold(
          appBar: appBar(cubit),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                bookPic(),
                SizedBox(height: 20),
                nameNcategory(),
                SizedBox(height: 20),
                bookDescription(),
              ],
            ),
          ),
          bottomNavigationBar: priceNAdd2cart(),
        );
      },
    );
  }

  AppBar appBar(HomeCubit cubit) {
    return AppBar(
      leading: AppBarArrow(),
      leadingWidth: 70,
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
          child: GestureDetector(
            child: SvgPicture.asset(
              AssetNames.wishlist,
              width: 28,
              height: 28,
              colorFilter: ColorFilter.mode(
                cubit.isWishlist(widget.product.id ?? 0)
                    ? AppColors.primaryColor
                    : AppColors.darkColor,
                BlendMode.srcIn,
              ),
            ),
            onTap: () {
              cubit.addRemoveToWishlist(widget.product.id ?? 0);
            },
          ),
        ),
      ],
    );
  }

  SafeArea priceNAdd2cart() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 70,
                color: AppColors.whiteColor,
                child: Center(
                  child: Text(
                    '\$${widget.product.price ?? '0.00'}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            MainButton(
              text: 'Add to cart',
              onPressed: () {},
              height: 60,
              width: 250,
              backgroundColor: AppColors.darkColor,
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding bookDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        widget.product.description != null
            ? widget.product.description!.substring(
                3,
                widget.product.description!.length - 4,
              )
            : '',
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.left,
      ),
    );
  }

  Column nameNcategory() {
    return Column(
      children: [
        Text(
          widget.product.name ?? '',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          widget.product.category ?? '',
          style: TextStyle(fontSize: 18, color: AppColors.primaryColor),
        ),
      ],
    );
  }

  Center bookPic() {
    return Center(
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Image.network(widget.product.image ?? '', fit: BoxFit.cover),
      ),
    );
  }
}
