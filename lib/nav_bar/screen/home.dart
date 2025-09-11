import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/helpers/colors.dart';
import 'package:menshop/helpers/text_style.dart';
import 'package:menshop/widgets/category_cubit.dart';
import 'package:menshop/nav_bar/products/product_cubit.dart';
import 'package:menshop/nav_bar/products/product-state.dart';
import 'package:menshop/nav_bar/products/produuct_item.dart';
import 'package:menshop/widgets/all_categories.dart';
part '../products/all_products.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(
          create: (_) => ProductCubit()..getProducts(),),
        BlocProvider(
          create: (_) => CategoryCubit()..getCategoryProducts(),),
      ],
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColors.scaffoldBackGroundColor,
        body: Column(
          children: [
            AllCategories(),
            AllProductHomePage(),
          ],
        ),
      ),

    );
  }
}
