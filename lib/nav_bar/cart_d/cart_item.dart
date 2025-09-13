part of '../screen/cart.dart';

class CartItemWidget extends StatelessWidget {
  final String amount;
  final String name;
  final double price;
  final String image;

  const CartItemWidget({
    super.key,
    required this.amount,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.image_not_supported,
            color: Colors.grey,
            size: 40,
          ),
        ),
      ),
      title: Text(name, style: AppTextStyles.kTextStyle16MediumBlack),
      subtitle: Text("\$ $price x $amount"),
      trailing: Text(
        "\$ ${(price * int.parse(amount)).toStringAsFixed(2)}",
        style: AppTextStyles.kTextStyle16MediumBlack,
      ),
    );
  }
}
