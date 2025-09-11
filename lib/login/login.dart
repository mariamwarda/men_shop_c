import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/helpers/button.dart';
import 'package:menshop/helpers/colors.dart';
import 'package:menshop/helpers/field.dart';
import 'package:menshop/helpers/text_style.dart';
import 'package:menshop/helpers/bar.dart';
import 'package:menshop/login/cubit.dart';
import 'package:menshop/login/state.dart';
import 'package:menshop/nav_bar/nav_bar.dart';
import 'package:menshop/signup/sign_up.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => LoginCubit(),
      child: const Login(),
    ),
  );
}


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.scaffoldBackGroundColor,
        body: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginFailure) {
              mySnackBar(
                  msg: state.msg,
                  type: AnimatedSnackBarType.error,
                  context: context);
            }
            if (state is LoginSuccess) {
              mySnackBar(
                  msg: "loginSuccess".tr(),
                  type: AnimatedSnackBarType.success,
                  context: context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeNavScreen()),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.only(
                  left: 24.0, right: 24, top: 70, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("loginToYourAccount",
                      style: AppTextStyles.kHeadTextStyle32)
                      .tr(),
                  const SizedBox(height: 4),
                  Text("welcome", style: AppTextStyles.kTextStyle16Grey).tr(),
                  const SizedBox(height: 24),
                  Text("UserName", style: AppTextStyles.kTextStyle16MediumBlack)
                      .tr(),
                  const SizedBox(height: 4),
                  Field(
                    hintText: "yourName".tr(),
                    controller: cubit.nameController,
                  ),
                  const SizedBox(height: 16),
                  Text("Password", style: AppTextStyles.kTextStyle16MediumBlack)
                      .tr(),
                  const SizedBox(height: 4),
                  Field(
                    isPassword: true,
                    controller: cubit.passwordController,
                    hintText: "Enter your password".tr(),
                  ),
                  const SizedBox(height: 55),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Buttom(
                        text: "login".tr(),
                        onPressed: () => cubit.login(),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("dontHaveAccount",
                              style: AppTextStyles.kTextStyle16Grey)
                              .tr(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const CreateAccountScreen()),
                              );
                            },
                            child: Text(
                              "signup".tr(),
                              style: AppTextStyles.kTextStyle16MediumBlack
                                  .copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
          )
      );
    }
}