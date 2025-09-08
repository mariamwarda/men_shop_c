import 'package:flutter/material.dart';
import 'package:menshop/helpers/colors.dart';

class AppTextStyles{
  static const kHeadTextStyle32=TextStyle(
      fontSize: 35,
      color: Colors.black,
      fontWeight: FontWeight.w800
  );
  static const kTextStyle16Grey=TextStyle(
      fontSize: 16,
      color: Color(0xff808080),
      fontWeight: FontWeight.w500
  );
  static const kTextStyle16MediumBlack=TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w800
  );
  static const kTextStyle16MediumGrey=TextStyle(
      fontSize: 16,
      color: AppColors.boldGreyColor,
      fontWeight: FontWeight.w500
  );
  static const kTextStyle24MediumBlack=TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.w700
  );
  static const kTextStyle16UnderLineMediumBlack= TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      decoration: TextDecoration.underline
  );
  static const kTextStyle14MediumWhite=TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w500
  );

}