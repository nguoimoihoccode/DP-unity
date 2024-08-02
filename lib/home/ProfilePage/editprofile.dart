import 'package:flutter/material.dart';
import 'package:ideco_app/home/ProfilePage/widgets/editprofile_form.dart';
import 'package:ideco_app/utils/constants/sizes.dart';
import 'package:ideco_app/utils/constants/text_strings.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(TTexts.EditprofileTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              const EditForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Divider
              // FormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Social Buttons
              // const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}