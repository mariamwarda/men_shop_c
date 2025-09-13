import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menshop/helpers/assets.dart';
import 'package:menshop/helpers/button.dart';
import 'package:menshop/helpers/text_style.dart';
import 'package:menshop/helpers/cach_helper.dart';
import 'package:menshop/login/login.dart';

class LogOutSheet {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
            height: MediaQuery.of(context).size.height * 0.4,
            // width: 400.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                spacing: 12.h,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(AppAssets.splashJson),
                  Text(
                    "Logout?",
                    style: AppTextStyles.kTextStyle16MediumBlack,
                  ),
                  Text("Are you sure you want to logout?"),
                  Buttom(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      CacheHelper.deleteToken();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    text: "Yes LogOut",
                  ),
                  // SizedBox(height: 4.h,),
                  Buttom(
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "No Cancel",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}