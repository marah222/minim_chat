import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat/auth/login_or_register.dart';

import '../pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snashot){
          // user is logged in
          if(snashot.hasData){
            return const HomePage();
          }
          // user is not logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
