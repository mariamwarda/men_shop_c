import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/networking/dio-h.dart';
import 'package:menshop/splash/splash.dart';
import 'package:menshop/nav_bar/products/product_cubit.dart';
import 'package:menshop/widgets/category_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initDio();
  await EasyLocalization.ensureInitialized();

  runApp(
   // EasyLocalization(
    //  supportedLocales: const [Locale('ENG'), Locale('ar')],
     // path: 'assets/translations/',
     // fallbackLocale: const Locale('ENG'),
      //startLocale: const Locale('ENG'),
   // ),
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductCubit()..getProducts()),
        BlocProvider(create: (_) => CategoryCubit()..getCategoryProducts()),
      ],
      child: MaterialApp(
        //localizationsDelegates: context.localizationDelegates,
        //supportedLocales: context.supportedLocales,
        //locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'MenShop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
