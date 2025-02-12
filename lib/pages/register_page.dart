import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minimal_chat/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatelessWidget {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  // tap to go to login page
  final void Function()? onTap;
  //
  RegisterPage({super.key, this.onTap});
  //
  void register(BuildContext context) {
    final _auth = AuthService();
    if(_passwordController.text== _confirmPasswordController.text){
      try{
        _auth.singUpWithEmailPassword(
            _emailController.text.trim(),
            _passwordController.text.trim()
        );
      }catch (e){
        showDialog(context: context,
            builder:(context)=> AlertDialog(
              title: Text(e.toString()),
            ) );
      }

    }
    else{
      showDialog(context: context,
          builder:(context)=> AlertDialog(
            title: Text("Password don't match!"),
          ) );
    }

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
              "Let's create an account for you",
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
              height: 10,
            ),
            //consfirm pw textField
            MyTextField(
              hintText: "Confirm password",
              obscureText: true,
              controller: _confirmPasswordController,
            ),
            const SizedBox(
              height: 25,
            ),

            //login button
            MyButton(text: "Register", onTap:()=> register(context)),
            const SizedBox(
              height: 25,
            ),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Login now",
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
