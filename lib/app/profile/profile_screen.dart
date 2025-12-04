import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/auth/data/auth_services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, ) {
void popPage(){
  Navigator.pop(context);
}

void logout()async{
  try{
    await authService.value.signOut();
    popPage();
  }on FirebaseAuthException catch(e){
    print(e.message);
  }
}
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: IconButton(onPressed: logout, icon: Icon(Icons.logout)),
      ),

    );
  }
}
