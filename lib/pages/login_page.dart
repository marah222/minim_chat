import 'package:flutter/material.dart';
import 'package:minimal_chat/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // tap to go to register page
  final void Function()? onTap;
  //
  LoginPage({super.key, required this.onTap});
  //
  void login(BuildContext context) {
    // auth service
    final authService = AuthService();
    // try log in
    try{
      authService.singInWithEmailPassword(_emailController.text.trim(), _passwordController.text.trim());
    } catch (e) {
      showDialog(context: context,
          builder:(context)=> AlertDialog(
            title: Text(e.toString()),
          ) );
    }

    // catch any error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),
            //welcom back message
            Text(
              "Welcome back, you've been missed!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),

            const SizedBox(
              height: 25,
            ),
            //email textField
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            //pw textField

            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(
              height: 25,
            ),

            //login button
            MyButton(text: "Log In", onTap:()=> login(context)),
            const SizedBox(
              height: 25,
            ),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?",  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Register now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
