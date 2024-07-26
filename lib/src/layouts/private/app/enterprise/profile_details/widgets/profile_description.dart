// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:job_app/src/components/styles/constants/sizes.dart';
// import 'package:job_app/src/models/personal_profile_model.dart';
// import 'package:job_app/src/utils/helpers/device_func.dart';

// class JProfileDetailDescription extends StatelessWidget {
//   const JProfileDetailDescription({
//     super.key,
//     required this.profile,
//   });

//   final PersonalProfileModel profile;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Icon(Iconsax.user),
//             const SizedBox(width: JSizes.spaceBtwItems / 2),
//             SizedBox(
//               width: JDevice.getScreenWidth(context) - 100,
//               child: Text(
//                 'profile.userName'.toUpperCase(),
//                 style: Theme.of(context).textTheme.bodyLarge,
//                 maxLines: 5,
//               ),
//             )
//           ],
//         ),
//         const SizedBox(height: JSizes.sm),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Icon(Iconsax.location),
//             const SizedBox(width: JSizes.spaceBtwItems / 2),
//             SizedBox(
//               width: JDevice.getScreenWidth(context) - 100,
//               child: Text(
//                 "  profile.address",
//                 style: Theme.of(context).textTheme.bodyLarge,
//                 maxLines: 5,
//               ),
//             )
//           ],
//         ),
//         const SizedBox(height: JSizes.sm),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Icon(Iconsax.direct_right),
//             const SizedBox(width: JSizes.spaceBtwItems / 2),
//             SizedBox(
//               width: JDevice.getScreenWidth(context) - 100,
//               child: Text(
//                 '   profile.categoryName',
//                 style: Theme.of(context).textTheme.bodyLarge,
//                 maxLines: 5,
//               ),
//             )
//           ],
//         ),
//         const SizedBox(height: JSizes.sm),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Icon(Iconsax.sms),
//             const SizedBox(width: JSizes.spaceBtwItems / 2),
//             SizedBox(
//               width: JDevice.getScreenWidth(context) - 100,
//               child: Text(
//                 '  profile.email',
//                 style: Theme.of(context).textTheme.bodyLarge,
//                 maxLines: 5,
//               ),
//             )
//           ],
//         ),
//         const SizedBox(height: JSizes.sm),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Icon(Iconsax.mobile),
//             const SizedBox(width: JSizes.spaceBtwItems / 2),
//             SizedBox(
//               width: JDevice.getScreenWidth(context) - 100,
//               child: Text(
//                 ' profile.phon',
//                 style: Theme.of(context).textTheme.bodyLarge,
//                 maxLines: 5,
//               ),
//             )
//           ],
//         ),
//         const SizedBox(height: JSizes.sm),
//       ],
//     );
//   }
// }
