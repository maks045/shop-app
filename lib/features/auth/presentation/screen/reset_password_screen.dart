import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/auth_services.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    emailController.text = widget.email;
  }
  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
  }

  void resetPassword()async{
    try {
      await authService.value.resetPassword(email: emailController.text);
      showSnackBar();
      setState(() {
        errorMessage = '';
      });
    }on FirebaseException catch (e){
      setState(() {
        errorMessage = e.message ?? 'An error occurred during password reset.';

      });
    }
  }

  void showSnackBar() {
ScaffoldMessenger.of(context).clearMaterialBanners();
ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  content: const Text('Password reset email sent! Check your email.'),
  backgroundColor: Colors.green,
showCloseIcon: true,
));}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        centerTitle: true,
      ),
      body: Center(
        child:Form(child: Column(children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            validator: (v) {
              final value = v ?? '';
              if (value.isEmpty) return 'Please enter email';
              if (!RegExp(
                r"^[^@\s]+@[^@\s]+\.[^@\s]+$",
              ).hasMatch(value))
                return 'Enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: 20),
ElevatedButton(onPressed: resetPassword, child: const Text('Reset Password'))
        ],)) ,
      )
    );
  }
}
