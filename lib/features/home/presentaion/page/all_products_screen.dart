import 'package:bookia/components/app_bar_arrow.dart';
import 'package:bookia/components/search_field.dart';
import 'package:bookia/core/extentions/dialoges.dart';
import 'package:bookia/features/home/presentaion/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentaion/cubit/home_state.dart';
import 'package:bookia/features/home/presentaion/widget/grid_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AppBarArrow(), leadingWidth: 70),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          if (state is HomeLoadingState) {
            return Center(child: getLoadingWidget());
          } else if (state is HomeFailureState) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SearchFields(
                    label: 'Search Store',
                    onChanged: (value) {
                      // Handle search logic here
                    },
                  ),
                  SizedBox(height: 25),
                  GridBuilder(products: cubit.allProductsList),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
