import 'package:bookia/core/constants/asset_names.dart';
import 'package:bookia/core/extentions/dialoges.dart';
import 'package:bookia/core/routes/navigators.dart';
import 'package:bookia/core/routes/router.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/home/presentaion/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentaion/cubit/home_state.dart';
import 'package:bookia/features/home/presentaion/widget/grid_builder.dart';
import 'package:bookia/features/home/presentaion/widget/home_horiz_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetNames.logo, height: 30),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AssetNames.searchIcon, height: 24),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          if (state is HomeLoadingState) {
            return Center(child: getLoadingWidget());
          } else if (state is HomeFailureState) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    HomeHorizScroll(products: cubit.slidersList),
                    SizedBox(height: 30),
                    bestSellersRow(context),
                    SizedBox(height: 15),
                    GridBuilder(products: cubit.bestSellersList),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Row bestSellersRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Best Sellers',
          style: TextStyles.getTitle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            pushTo(context, Routes.allProducts);
          },
          child: Text(
            'View All',
            style: TextStyles.getBody(
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
