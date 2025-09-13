import 'package:flutter/material.dart';
import 'package:menshop/helpers/colors.dart';
import 'package:menshop/helpers/text_style.dart';
class Buttom extends StatelessWidget {
  Buttom({super.key,required this.onPressed, this.text,this.widget, this.textColor, this.backgroundColor});
  void Function()? onPressed;
  String ?text;
  Widget?widget;
  Color ?textColor;
  Color ?backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:ElevatedButton.styleFrom(
          fixedSize: Size.fromHeight(60),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          backgroundColor: AppColors.primaryColor,
        ) ,
        onPressed: onPressed,
        child:widget?? Text(text??"",style: AppTextStyles.kTextStyle14MediumWhite,))

    ;
  }
}
