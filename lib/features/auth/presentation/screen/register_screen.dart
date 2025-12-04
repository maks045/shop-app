import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/auth_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void dispose(){
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();

  }


  void register()async{
    try{

    await authService.value.createAccount(
      email: controllerEmail.text,
      password: controllerPassword.text,

    );
    popPage();
  } on FirebaseAuthException catch(e) {
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
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controllerEmail,
                decoration: InputDecoration(

                  labelText: 'Email',
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controllerPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    register();
                  }
                },
                child: Text('Register'),
              ),
              Text(errorMessage),
            ],
          ),
        ),
      );
  }
}
