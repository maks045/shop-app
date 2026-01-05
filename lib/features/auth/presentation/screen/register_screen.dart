import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/buttons/app_button.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/auth_services.dart';
import '../field/email_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
@override
 void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset('asset/logo/logo.png'),
            const SizedBox(height: 30),
            TabBar(
              controller: _controller,
              labelColor: AppTheme.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: AppTheme.headlineMedium,
              unselectedLabelStyle: AppTheme.headlineMedium,
              tabs: const [
                Tab(text: 'Login'),
                Tab(text: 'Register'),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [LoginForm(), SignUpForm()],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Manual Sign Up',style: TextStyle(color: AppTheme.black,fontSize: 16),),
          const SizedBox(height: 20),
          InputField(),
          const SizedBox(height: 20),
          Divider(),
          const SizedBox(height: 20),
          const Text('Connect with Social Media',style: TextStyle(color: AppTheme.black,fontSize: 16),),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}




