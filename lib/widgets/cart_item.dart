import 'package:flutter/material.dart';
import 'package:menshop/helpers/colors.dart';
import 'package:menshop/helpers/text_style.dart';
class CartItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final String size;
  final int price;
  final int quantity;
  final VoidCallback? onRemove;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  const CartItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.size,
    required this.price,
    required this.quantity,
    this.onRemove,
    this.onIncrease,
    this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.kTextStyle16MediumBlack),
                Text("Size $size", style: AppTextStyles.kTextStyle16Grey),
                const SizedBox(height: 4),
                Text("\$ $price", style: AppTextStyles.kTextStyle14MediumWhite.copyWith(color: Colors.black)), // السعر
              ],
            ),
          ),

          Column(
            children: [
              IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.delete_outline, color: AppColors.red),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: onDecrease,
                  ),
                  Text(
                    quantity.toString(),
                    style: AppTextStyles.kTextStyle16MediumBlack.copyWith(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: onIncrease,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
