import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/helpers/colors.dart';
import 'package:menshop/helpers/text_style.dart';
import 'package:menshop/helpers/button.dart';
import 'package:menshop/helpers/field.dart';
import 'package:menshop/login/login.dart';
import 'package:menshop/signup/signup_cubit.dart';
import 'package:menshop/signup/signup_state.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => SignUpCubit(),
      child: const CreateAccountScreen(),
    ),
  );
}

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();


    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Account created successfully!")),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          }

          if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.msg)),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<SignUpCubit>();

          if (state is SignUpLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create an account",
                      style: AppTextStyles.kTextStyle24MediumBlack),
                  const SizedBox(height: 4),
                  Text("Let’s create your account.",
                      style: AppTextStyles.kTextStyle16Grey),
                  const SizedBox(height: 32),

                  Text(
                    "Full Name",
                    style: AppTextStyles.kTextStyle16MediumBlack,
                  ),
                  const SizedBox(height: 4),
                  Field(
                    controller: nameController,
                    hintText: "Enter your full name",
                  ),
                  const SizedBox(height: 16),

                  Text(
                    "Email",
                    style: AppTextStyles.kTextStyle16MediumBlack,
                  ),
                  const SizedBox(height: 4),
                  Field(
                    controller: emailController,
                    hintText: "Enter your email address",
                  ),
                  const SizedBox(height: 16),

                  Text(
                    "Password",
                    style: AppTextStyles.kTextStyle16MediumBlack,
                  ),
                  const SizedBox(height: 4),
                  Field(
                    controller: passwordController,
                    hintText: "Enter your password",
                    isPassword: true,
                  ),
                  const SizedBox(height: 16),

                  Text(
                    "Confirm Password",
                    style: AppTextStyles.kTextStyle16MediumBlack,
                  ),
                  const SizedBox(height: 4),
                  Field(
                    controller: confirmPasswordController,
                    hintText: "Confirm your password",
                    isPassword: true,
                  ),

                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Buttom(
                        text: "Create Account",
                        onPressed: () {cubit.signUp();},
                      ),
                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: AppTextStyles.kTextStyle16Grey,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            child: Text(
                              "Log In",
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
            ),
          );
        },
      ),
      )
    );
  }
}
