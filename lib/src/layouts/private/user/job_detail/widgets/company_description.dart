import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/utils/helpers/device_func.dart';

class JCompanyDescription extends StatelessWidget {
  const JCompanyDescription({
    super.key,
    required this.companyName,
    required this.companyAddress,
    required this.companyTaxCode,
    required this.companyHotline,
    required this.companyEmail,
    this.websiteUrl = '',
    this.fanpageUrl = '',
    this.isWebsite = false,
    this.isFanpage = false,
  });

  final bool isWebsite, isFanpage;
  final String companyName,
      companyAddress,
      companyTaxCode,
      companyHotline,
      companyEmail;
  final String websiteUrl, fanpageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Iconsax.buildings),
            const SizedBox(width: JSizes.spaceBtwItems / 2),
            SizedBox(
              width: JDevice.getScreenWidth(context) - 100,
              child: Text(
                companyName,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 5,
              ),
            )
          ],
        ),
        const SizedBox(height: JSizes.sm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Iconsax.location),
            const SizedBox(width: JSizes.spaceBtwItems / 2),
            SizedBox(
              width: JDevice.getScreenWidth(context) - 100,
              child: Text(
                companyAddress,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 5,
              ),
            )
          ],
        ),
        const SizedBox(height: JSizes.sm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Iconsax.award),
            const SizedBox(width: JSizes.spaceBtwItems / 2),
            SizedBox(
              width: JDevice.getScreenWidth(context) - 100,
              child: Text(
                'MST: $companyTaxCode',
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 5,
              ),
            )
          ],
        ),
        const SizedBox(height: JSizes.sm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Iconsax.sms),
            const SizedBox(width: JSizes.spaceBtwItems / 2),
            SizedBox(
              width: JDevice.getScreenWidth(context) - 100,
              child: Text(
                companyEmail,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 5,
              ),
            )
          ],
        ),
        const SizedBox(height: JSizes.sm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Iconsax.mobile),
            const SizedBox(width: JSizes.spaceBtwItems / 2),
            SizedBox(
              width: JDevice.getScreenWidth(context) - 100,
              child: Text(
                companyHotline,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 5,
              ),
            )
          ],
        ),
        const SizedBox(height: JSizes.sm),
        isFanpage
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Iconsax.send_1),
                  const SizedBox(width: JSizes.spaceBtwItems / 2),
                  SizedBox(
                    width: JDevice.getScreenWidth(context) - 100,
                    child: Text(
                      fanpageUrl,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 5,
                    ),
                  )
                ],
              )
            : Container(),
        const SizedBox(height: JSizes.sm),
        isWebsite
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Iconsax.global),
                  const SizedBox(width: JSizes.spaceBtwItems / 2),
                  SizedBox(
                    width: JDevice.getScreenWidth(context) - 100,
                    child: Text(
                      websiteUrl,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 5,
                    ),
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}
