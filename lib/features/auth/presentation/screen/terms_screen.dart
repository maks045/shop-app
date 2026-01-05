import 'package:flutter/material.dart';

import '../../../../core/buttons/app_button.dart';
import '../../../../core/theme/app_theme.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key, required this.onAgree});
  final VoidCallback onAgree;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Image.asset('asset/logo/logo.png'),
              const SizedBox(height: 16),
              Text('Welcome to Nord !',style: TextTheme.of(context).titleLarge!.copyWith(color: AppTheme.black),),
              const SizedBox(height: 16),
              Text(
                'By continuing, you agree to the Terms of Use and Privacy Policy.',
                style: TextTheme.of(context).titleMedium!.copyWith(color: AppTheme.black),
              ),
              SizedBox(height: 16),
              Text('Terms of Use',
                style: TextTheme.of(context).titleMedium!.copyWith(color: AppTheme.black),
              ),
              const SizedBox(height: 16),
              Text(
                'By using Nord, you agree to comply with our Terms of Use. Please read them carefully to understand your rights, responsibilities, and the rules for using our services. These terms govern your access to and use of our platform, including any content, features, and interactions with other users. By continuing, you acknowledge and accept these terms, agree to use Nord responsibly, and understand that any misuse may result in suspension or termination of your account. It is your responsibility to stay informed about updates to these terms, and by continuing to use the service, you confirm your agreement with any changes.',
             style: TextTheme.of(context).titleSmall!.copyWith(color: AppTheme.grey),
              ),
              SizedBox(height: 30),
              AppButton(text: 'I agree', onPressed: onAgree,)
            ],
          ),
        ),
      ),
    );
  }
}
