import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ideco_app/utils/constants/sizes.dart';
import 'package:ideco_app/utils/constants/text_strings.dart';

class EditForm extends StatelessWidget {
  const EditForm({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// Username
          TextFormField(
            decoration: const InputDecoration(
                labelText: TTexts.Name,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          TextFormField(
            decoration: const InputDecoration(
                labelText: TTexts.IDUser,
                prefixIcon: Icon(Iconsax.user)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          TextFormField(
            decoration: const InputDecoration(
                labelText: TTexts.ID,
                prefixIcon: Icon(Iconsax.user)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            decoration: const InputDecoration(
                labelText: TTexts.email, 
                prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            decoration: const InputDecoration(
                labelText: TTexts.Aboutme, 
                prefixIcon: Icon(Iconsax.document)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Terms&Conditions
          // const TermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Sign Up Button
          // SizedBox(
          //     width: double.infinity,
          //     child: ElevatedButton(
          //         onPressed: () => Get.to(() => const VerifyEmailScreen()),
          //         child: const Text(TTexts.createAccount)))
        ],
      ),
    );
  }
}
