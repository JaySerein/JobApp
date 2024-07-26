import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';
import 'package:job_app/src/layouts/public/sign_up/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(JSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                Text(
                  JTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: JSizes.spaceBtwSections),
                //form
                SignUpForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
