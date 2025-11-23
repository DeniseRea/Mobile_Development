import 'package:flutter/material.dart';
import 'package:michi_app/design/infraestructure/templates/login.dart';

class ScreenLogin extends StatelessWidget {
  final VoidCallback onLoginSuccess;

  const ScreenLogin({
    Key? key,
    required this.onLoginSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      onLoginSuccess: onLoginSuccess,
    );
  }
}
