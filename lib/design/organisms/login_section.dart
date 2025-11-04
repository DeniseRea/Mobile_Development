// login_section.dart
import 'package:flutter/material.dart';
import '../atoms/app_text.dart';
import '../molecules/login_form.dart';
import '../atoms/colors.dart';
class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        AppText(
          "Bienvenido",
          size: 40,
          color: AppColors.primary,
          align: TextAlign.center,

        ),
        SizedBox(height: 8),
        AppText(
          "Inicia sesión para continuar",
          color: Colors.grey,
          size: 24,

        ),
        SizedBox(height: 24),
        LoginForm(), //forms
      ],
    );
  }
}
