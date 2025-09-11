import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menshop/helpers/assets.dart';
import 'package:menshop/helpers/colors.dart';
import 'package:menshop/nav_bar/screen/account.dart';
import 'package:menshop/nav_bar/screen/cart.dart';
import 'package:menshop/nav_bar/screen/home.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomePage(),
    Cart(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackGroundColor,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: AppColors.scaffoldBackGroundColor,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.greyColor,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.homeSvg,
                  colorFilter: ColorFilter.mode(
                      currentIndex == 0
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                      BlendMode.srcIn),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.cartSvg,
                  colorFilter: ColorFilter.mode(
                      currentIndex == 1
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                      BlendMode.srcIn),
                ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: "Account"),
          ]),
      body: screens[currentIndex],
    );
  }
}
