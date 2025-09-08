import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/helpers/button.dart';
import 'package:menshop/helpers/colors.dart';
import 'package:menshop/helpers/field.dart';
import 'package:menshop/helpers/text_style.dart';
import 'package:menshop/helpers/bar.dart';
import 'package:menshop/login/cubit.dart';
import 'package:menshop/login/state.dart';
import 'package:menshop/nav_bar/screen/home.dart';
import 'package:menshop/signup/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Login(),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackGroundColor,
      body: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginFailure) {
            mySnackBar(
              msg: state.msg,
              type: AnimatedSnackBarType.error,
              context: context,
            );
          }
          if (state is LoginSuccess) {
            mySnackBar(
              msg: "Login Success",
              type: AnimatedSnackBarType.success,
              context: context,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
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
              left: 24.0,
              right: 24,
              top: 70,
              bottom: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Login to your account",
                  style: AppTextStyles.kHeadTextStyle32,
                ),
                const SizedBox(height: 4),
                Text(
                  "It’s great to see you again.",
                  style: AppTextStyles.kTextStyle16Grey,
                ),
                const SizedBox(height: 24),
                Text(
                  "User Name",
                  style: AppTextStyles.kTextStyle16MediumBlack,
                ),
                const SizedBox(height: 4),
                Field(
                  hintText: "Enter Your Name",
                  controller: cubit.nameController,
                ),
                const SizedBox(height: 16),
                Text(
                  "Password",
                  style: AppTextStyles.kTextStyle16MediumBlack,
                ),
                const SizedBox(height: 4),
                Field(
                  hintText: "Enter your user password",
                  controller: cubit.passwordController,
                  isPassword: true,
                ),

                const SizedBox(height: 55),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Buttom(
                      text: "Login",
                      onPressed: () => cubit.login(),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: AppTextStyles.kTextStyle16Grey,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreateAccountScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: AppTextStyles.kTextStyle16MediumBlack.copyWith(
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
    );
  }
}
