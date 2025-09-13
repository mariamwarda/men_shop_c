import 'package:flutter/material.dart';
import '../../features/cartItem_model.dart';
import '../../helpers/button.dart';
import '../../helpers/colors.dart';
import '../../helpers/text_style.dart';
import '../../helpers/assets.dart';
part '../cart_d/cart_item.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List<CartItem> items = [
    CartItem(
      name: "T-Shirt",
      price: 200,
      quantity: 3,
      image:AppAssets.tShirt,
    ),
    CartItem(
      name: "Shoes",
      price: 500,
      quantity: 1,
      image:AppAssets.tShirt,
    ),
  ];

  double get subTotal {
    return items.fold(
      0,
          (sum, item) => sum + (item.price * item.quantity),
    );
  }

  double get vat => 0.0;
  double get shipping => 80.0;

  double get total => subTotal + vat + shipping;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.scaffoldBackGroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackGroundColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.boldGreyColor),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("My Cart", style: AppTextStyles.kTextStyle24MediumBlack),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CartItemWidget(
                      amount: item.quantity.toString(),
                      name: item.name,
                      price: item.price,
                      image: item.image,
                    );
                  },
                ),
              ),

              Column(
                children: [
                  _buildSummaryRow(
                      "Sub-total", "\$ ${subTotal.toStringAsFixed(2)}"),
                  _buildSummaryRow("VAT (%)", "\$ ${vat.toStringAsFixed(2)}"),
                  _buildSummaryRow(
                      "Shipping fee", "\$ ${shipping.toStringAsFixed(2)}"),
                  const Divider(),
                  _buildSummaryRow("Total", "\$ ${total.toStringAsFixed(2)}",
                      isBold: true, fontSize: 18),
                ],
              ),

              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Buttom(
                    text: "Go To Checkout",
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value,
      {bool isBold = false, double fontSize = 14}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isBold
                ? AppTextStyles.kTextStyle16MediumBlack
                .copyWith(fontSize: fontSize)
                : AppTextStyles.kTextStyle16Grey
                .copyWith(fontSize: fontSize),
          ),
          Text(
            value,
            style: isBold
                ? AppTextStyles.kTextStyle16MediumBlack
                .copyWith(fontSize: fontSize)
                : AppTextStyles.kTextStyle16Grey
                .copyWith(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
