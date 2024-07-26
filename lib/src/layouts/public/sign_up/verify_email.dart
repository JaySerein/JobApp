import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';
import 'package:job_app/src/components/widgets/success_screen/success.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.deleteAll();
                Get.offAndToNamed('signin');
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              //image
              Image(
                image: const AssetImage(JImages.emailSend),
                width: JHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: JSizes.spaceBtwSections,
              ),
              //title subtitle
              Text(
                JTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: JSizes.spaceBtwItems,
              ),
              Text(
                'itbmt08@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: JSizes.spaceBtwItems,
              ),
              Text(
                JTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: JSizes.spaceBtwSections,
              ),
              //buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => SuccessScreen(
                          image: JImages.success,
                          title: JTexts.yourAccountCreatedTitle,
                          subTitle: JTexts.yourAccountCreatedSubTitle,
                          onPressed: () => Get.offAndToNamed('signin'),
                        )),
                    child: const Text(JTexts.tContinue)),
              ),
              const SizedBox(
                height: JSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: const Text(JTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
