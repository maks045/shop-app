import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/app/shop/presentation/widgets/app_drawer.dart';
import 'package:shop_app/core/extensions/router_extension.dart';
import 'package:shop_app/features/auth/data/auth_services.dart';
import 'package:shop_app/features/auth/presentation/screen/onboarding/first_onboarding.dart';

import '../../core/theme/app_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const FirstOnboarding()),
      (route) => false,
    );

    void logout() async {
      try {
        await authService.value.signOut();

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const FirstOnboarding()),
          (route) => false,
        );
      } on FirebaseAuthException catch (e) {
        debugPrint(e.message);
      }
    }

    XFile? pickedImage;

    Future<void> pickPhoto() async {
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );

      if (image != null) {
        setState(() {
          pickedImage = image;
        });
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // height: 200,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => context.push(AppDrawer()),
                          icon: Icon(Icons.menu),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.settings, color: AppTheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Text(
                      'Account',
                      style: TextTheme.of(
                        context,
                      ).titleLarge!.copyWith(color: AppTheme.black),
                    ),
                    SizedBox(height: 18),

                    Row(
                      children: [
                        Image.asset(
                          'asset/img/Image.png',
                          height: 150,
                          width: 100,
                        ),
                        SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quinn Briar',
                              style: TextTheme.of(
                                context,
                              ).titleMedium!.copyWith(color: AppTheme.black),
                            ),
                            Text(
                              'email@gmail.com',
                              style: TextTheme.of(
                                context,
                              ).titleSmall!.copyWith(color: AppTheme.grey),
                            ),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primary,
                              ),
                              onPressed: () {},
                              child: Text(
                                'View Profile',
                                style: TextTheme.of(
                                  context,
                                ).titleSmall!.copyWith(color: AppTheme.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: IconButton(
                onPressed: () {
                  logout();
                },
                icon: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
