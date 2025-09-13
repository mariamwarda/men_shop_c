import 'package:flutter/material.dart';
import 'package:menshop/helpers/colors.dart';

class AppTextStyles {
  static final kHeadTextStyle32 = TextStyle(
    fontSize: 35,
    color: Colors.black,
    fontWeight: FontWeight.w800,
  );

  static final kTextStyle16Grey = TextStyle(
    fontSize: 16,
    color: AppColors.greyColor,
    fontWeight: FontWeight.w500,
  );

  static final kTextStyle16MediumBlack = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w800,
  );

  static final kTextStyle16MediumGrey = TextStyle(
    fontSize: 16,
    color: AppColors.boldGreyColor,
    fontWeight: FontWeight.w500,
  );

  static final kTextStyle24MediumBlack = TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static final kTextStyle16UnderLineMediumBlack = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    decoration: TextDecoration.underline,
  );

  static final kTextStyle14MediumWhite = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}
