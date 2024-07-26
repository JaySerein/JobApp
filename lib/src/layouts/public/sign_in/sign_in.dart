import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/customs/spacing_style.dart';
import 'package:job_app/src/layouts/public/sign_in/widgets/sign_in_form.dart';
import 'package:job_app/src/layouts/public/sign_in/widgets/sign_in_header.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: JSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo
              SignInHeader(dark: dark),
              const SizedBox(
                height: JSizes.sm,
              ),
              //Form
              SignInForm()
            ],
          ),
        ),
      ),
    );
  }
}
