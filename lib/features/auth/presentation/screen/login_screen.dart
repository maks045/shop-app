import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../field/password_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello again,',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: AppTheme.black)),
                  const Text('Quinnbriar',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w400,color: AppTheme.black)),
                ],
              ),
              CircleAvatar(child: Image.asset('asset/logo/logo.png',height: 50,width: 50)),
            ],
          ),
          const SizedBox(height: 20),

          Text("This isn't me",style: TextStyle(fontSize: 14,color: AppTheme.surfaceVariant),),
          const SizedBox(height: 20),
          // InputField(label: 'Email'),
          // const SizedBox(height: 20),
          PasswordField(),
          const SizedBox(height: 20),

          const SizedBox(height: 20),
          Text('Forgot Password',style: TextStyle(
              fontSize: 14,
              color: AppTheme.surfaceVariant),),
        ],
      ),
    );
  }
}
