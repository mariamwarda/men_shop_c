import 'package:flutter/material.dart';
import 'package:menshop/helpers/colors.dart';
import 'package:menshop/helpers/text_style.dart';
class Field extends StatelessWidget {
  Field({super.key,this.controller,this.eyeWidget,
    required this.hintText,this.showEyeIcon=false,this.obscureText=false});
  TextEditingController? controller;
  String? hintText;
  bool showEyeIcon;
  Widget ?eyeWidget;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText ,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon:showEyeIcon==false?SizedBox.shrink():eyeWidget,

          hintStyle: AppTextStyles.kTextStyle16Grey.copyWith(
              fontWeight: FontWeight.w400
          ),
          hintText:hintText ,
          focusedBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.borderFieldColor)

          )
      ),
    );
  }
}