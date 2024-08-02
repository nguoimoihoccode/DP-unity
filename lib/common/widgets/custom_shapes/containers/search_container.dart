// import 'package:bimnext_app/util/constants/colors.dart';
// import 'package:bimnext_app/util/constants/sizes.dart';
// import 'package:bimnext_app/util/device/device_utility.dart';
// import 'package:bimnext_app/util/helpers/pricing_function.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

// class SearchContainer extends StatelessWidget {
//   const SearchContainer({
//     super.key,
//     required this.text,
//     this.icon = Iconsax.search_normal,
//     this.showBackground = true,
//     this.showBorder = true,
//     this.onTap
//   });

//   final String text;
//   final IconData? icon;
//   final bool showBackground, showBorder;
//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);

//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
//         child: Container(
//             width: TDeviceUtils.getScreenWidth(context),
//             padding: const EdgeInsets.all(TSizes.md),
//             decoration: BoxDecoration(
//                 color: showBackground
//                     ? dark
//                         ? TColors.dark
//                         : TColors.white
//                     : Colors.transparent,
//                 borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
//                 border: showBorder ? Border.all(color: Colors.grey) : null),
//             child: Row(
//               children: [
//                 Icon(icon, color: TColors.darkGrey),
//                 const SizedBox(width: TSizes.spaceBtwItems),
//                 Text(
//                   text,
//                   style: Theme.of(context).textTheme.bodySmall,
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }
