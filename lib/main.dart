import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/networking/dio-h.dart';
import 'package:menshop/signup/signup_cubit.dart';
import 'package:menshop/splash/splash.dart';
import 'package:menshop/nav_bar/products/product_cubit.dart';
import 'package:menshop/nav_bar/categories/category_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login/cubit.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initDio();
  await EasyLocalization.ensureInitialized();

  runApp(
    //EasyLocalization(
    //  supportedLocales: const [Locale('en'), Locale('ar')],
    //  path: 'assets/translations',
     // fallbackLocale: const Locale('en'),
      //child: const MyApp(),
    //),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ProductCubit()..getProducts()),
            BlocProvider(create: (_) => CategoryCubit()..getCategoryProducts()),
            BlocProvider(create: (_) => LoginCubit()..login()),
            BlocProvider(create: (_) => SignUpCubit()..signUp()),


          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MenShop',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            //localizationsDelegates: context.localizationDelegates,
            //supportedLocales: context.supportedLocales,
            //locale: context.locale,
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
