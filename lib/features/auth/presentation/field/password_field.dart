import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/buttons/app_button.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/auth_services.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}


class _PasswordFieldState extends State<PasswordField> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
  void signIn()async{
    try{
      await authService.value.signIn(
        email: emailController.text,
        password: passwordController.text,
      );
      popPage();
    }on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message ?? 'An error occurred';
      });
    }
  }
  void popPage(){
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Email',style: TextStyle(color: Colors.grey,fontSize: 14),),
          Container(
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                border: InputBorder.none,
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please enter your email';
                }else if(!RegExp(
                  r"^[^@\s]+@[^@\s]+\.[^@\s]+$",
                ).hasMatch(value)){
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text('Password',style: TextStyle(color: Colors.grey,fontSize: 14),),
          Container(
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 4){
                  return 'Password must be at least 4 characters';
                }
                return null;
              },

            ),
          ),
          const SizedBox(height: 20),

          AppButton(text: 'Login',onPressed: (){
            if(formKey.currentState!.validate()){
              signIn();
            }

          }
          )],
      ),
    );  }
}