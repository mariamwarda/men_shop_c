import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/helpers/button.dart';
import 'package:menshop/helpers/text_style.dart';
import 'package:menshop/features/productModel.dart';

import 'package:menshop/helpers/bar.dart';

import '../cart_d/cart_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 22),
        color: Colors.white,
        height: 100,
        child: Row(
          spacing: 24,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: AppTextStyles.kTextStyle16MediumGrey,
                ),
                Text(
                  r"$" + model.price.toString(),
                  style: AppTextStyles.kTextStyle16MediumBlack,
                ),
              ],
            ),
            Expanded(
              child: BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  if(state is AddToCartSuccess){
                    mySnackBar(
                        msg:"Item Added successfully",
                        type:AnimatedSnackBarType.success ,context: context);
                  }
                  if(state is AddToCartFailure){
                    mySnackBar(
                        msg:"cannot add item to cart",
                        type:AnimatedSnackBarType.success ,context: context);
                  }
                },
                builder: (context, state) {
                  final cubit = context.read<CartCubit>();
                  if (state is CartLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Buttom(
                    onPressed: () {
                      cubit.addToCart();
                    },
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ),
                        Text(
                          "Add To Cart",
                          style: AppTextStyles.kTextStyle14MediumWhite
                              .copyWith(fontSize: 16),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: BackButton(),
        title: Text(
          "Details",
          style: AppTextStyles.kTextStyle24MediumBlack,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 12,
              ),
              SizedBox(height: 368, child: Image.network(model.image ?? "")),
              Text(
                model.title ?? "Fit Polo T Shirt",
                style: AppTextStyles.kTextStyle16MediumBlack,
              ),
              Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Text("${model.rating!.rate ?? 0}/5",
                      style: AppTextStyles.kTextStyle16UnderLineMediumBlack),
                  Text("(${model.rating!.count ?? 0} reviews)",
                      style: AppTextStyles.kTextStyle16MediumGrey),
                ],
              ),
              Text(
                model.description ??
                    "Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them",
                style: AppTextStyles.kTextStyle16MediumGrey,
              )
            ],
          ),
        ),
      ),
    );
  }
}