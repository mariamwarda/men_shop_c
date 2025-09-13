import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:menshop/helpers/assets.dart';
import 'package:menshop/helpers/cach_helper.dart';
import 'package:menshop/nav_bar/nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 6), () async {
      CacheHelper.getToken().then((value) {
        //if (value.isNotEmpty) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeNavScreen(),
              ));
      //  }
        //else {
         // Navigator.pushReplacement(
            //  context,
            ////  MaterialPageRoute(
            //    builder: (context) => Login(),
            //  ));
       // }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Lottie.asset(AppAssets.splashJson)),
    );
  }
}
