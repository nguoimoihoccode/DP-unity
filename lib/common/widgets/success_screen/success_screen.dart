// import 'package:bimnext_app/common/styles/spacing_styles.dart';
// import 'package:bimnext_app/util/constants/sizes.dart';
// import 'package:bimnext_app/util/constants/text_strings.dart';
// import 'package:bimnext_app/util/helpers/pricing_function.dart';
// import 'package:flutter/material.dart';

// class SuccessScreen extends StatelessWidget {
//   const SuccessScreen(
//       {super.key,
//       required this.image,
//       required this.title,
//       required this.subTitle,
//       required this.onPressed});

//   final String image, title, subTitle;
//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: TSpacingStyle.paddingWithAppBarHeight * 2,
//         child: Column(
//           children: [
//             /// Image
//             Image(
//                 image: AssetImage(image),
//                 width: THelperFunctions.screenWidth() * 0.6),
//             const SizedBox(height: TSizes.spaceBtwSections),

//             /// Title & SubTitle
//             Text(title,
//                 style: Theme.of(context).textTheme.headlineMedium,
//                 textAlign: TextAlign.center),
//             const SizedBox(height: TSizes.spaceBtwItems),
//             Text(subTitle,
//                 style: Theme.of(context).textTheme.labelMedium,
//                 textAlign: TextAlign.center),
//             const SizedBox(height: TSizes.spaceBtwSections),

//             /// Buttons
//             SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     onPressed: onPressed,
//                     child: const Text(TTexts.continues)))
//           ],
//         ),
//       ),
//     );
//   }
// }
