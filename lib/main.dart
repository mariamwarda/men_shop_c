import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/networking/dio-h.dart';
import 'package:menshop/splash/splash.dart';
import 'package:menshop/nav_bar/products/product_cubit.dart';
import 'package:menshop/nav_bar/categories/category_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initDio();
  await EasyLocalization.ensureInitialized();

  runApp(
    // EasyLocalization(
    //   supportedLocales: const [Locale('en'), Locale('ar')],
    //   path: 'assets/translations/',
    //   fallbackLocale: const Locale('en'),
    //   startLocale: const Locale('en'),
    //   child: MyApp(),
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // مقاسات التصميم (من Figma مثلاً)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ProductCubit()..getProducts()),
            BlocProvider(create: (_) => CategoryCubit()..getCategoryProducts()),
          ],
          child: MaterialApp(
            // localizationsDelegates: context.localizationDelegates,
            // supportedLocales: context.supportedLocales,
            // locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'MenShop',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
