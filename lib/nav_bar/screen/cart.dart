import 'package:flutter/material.dart';
import 'package:menshop/helpers/colors.dart';
import 'package:menshop/helpers/text_style.dart';
import 'package:menshop/helpers/assets.dart';
import 'package:menshop/helpers/button.dart';
import 'package:menshop/widgets/cart_item.dart';

void main() {
  runApp(const Cart());
}

class Cart extends StatelessWidget {
  const Cart({super.key});

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
            CartItemWidget(
              image: AppAssets.tShirt,
              title: "Regular Fit Slogan",
              size: "L",
              price: 1190,
              quantity: 2,
            ),
            CartItemWidget(
              image: AppAssets.tShirt,
              title: "Regular Fit Polo",
              size: "M",
              price: 1100,
              quantity: 1,
            ),
            const Spacer(),

            // Sub-total, VAT, Shipping
            Column(
              children: [
                _buildSummaryRow("Sub-total", "\$ 5,870"),
                _buildSummaryRow("VAT (%)", "\$ 0.00"),
                _buildSummaryRow("Shipping fee", "\$ 80"),
                const Divider(),
                _buildSummaryRow("Total", "\$ 5,950",
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
      )
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
                : AppTextStyles.kTextStyle16Grey.copyWith(fontSize: fontSize),
          ),
          Text(
            value,
            style: isBold
                ? AppTextStyles.kTextStyle16MediumBlack
                .copyWith(fontSize: fontSize)
                : AppTextStyles.kTextStyle16Grey.copyWith(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
