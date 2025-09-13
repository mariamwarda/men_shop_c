part of '../screen/cart.dart';
class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key, required this.amount,
  });
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.greyColor),
      ),
      child: Row(
        children: [
          Expanded(
              child: Image.asset(AppAssets.tShirt)),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Fit Slogan",style: AppTextStyles.kTextStyle14MediumWhite.copyWith(color: Colors.black),),
                    Icon(Icons.delete,color: Colors.red,)

                  ],
                ),
                Text("Size L",style: AppTextStyles.kTextStyle16MediumGrey,),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(r"$1190",style: AppTextStyles.kTextStyle16MediumBlack,),

                    Row(
                      spacing: 6.w,
                      children: [
                        Container(
                          height: 20,width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            border: Border.all(color: AppColors.greyColor),
                          ),
                          child: Icon(Icons.remove,size: 15.w,),

                        ),
                        Text(amount,style: AppTextStyles.kTextStyle16MediumBlack,),
                        Container(
                          height: 20,width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            border: Border.all(color: AppColors.greyColor),
                          ),
                          child: Icon(Icons.add,size: 15.w,),

                        ),

                      ],)

                  ],
                ),

              ],
            ),
          )


        ],
      ),

    );
  }
}