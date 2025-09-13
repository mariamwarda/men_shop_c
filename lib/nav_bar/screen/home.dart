import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menshop/helpers/colors.dart';
import 'package:menshop/helpers/text_style.dart';
import 'package:menshop/helpers/assets.dart';
import 'package:menshop/helpers/field.dart';
import 'package:menshop/nav_bar/products/product_cubit.dart';
import 'package:menshop/nav_bar/products/product-state.dart';
import 'package:menshop/nav_bar/categories/category_cubit.dart';
import 'package:menshop/nav_bar/products/product_details.dart';
part '../categories/all_categories.dart';
part '../products/all_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
          ProductCubit()
            ..getProducts(),),
        BlocProvider(
          create: (_) =>
          CategoryCubit()
            ..getCategoryProducts(),),
      ],
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackGroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text("Discover", style: AppTextStyles.kHeadTextStyle32),
              SizedBox(
                height: 16,
              ),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                      child: Field(
                        hintText: "Search for clothes...",
                        ShowIcon: true,
                      )),
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primaryColor),
                    child: SvgPicture.asset(
                      AppAssets.settings,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                child: AllCategories(),
              ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AllProductHomePage(),
                ],
              ),
            ),
          ),
          ]
          ),
        ),
      ),

    );
  }
}