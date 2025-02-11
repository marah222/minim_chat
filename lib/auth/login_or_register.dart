import 'package:flutter/cupertino.dart';
import 'package:minimal_chat/pages/login_page.dart';
import 'package:minimal_chat/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage
        ? LoginPage(
            onTap: togglePages,
          )
        : RegisterPage(
            onTap: togglePages,
          );
  }
}
