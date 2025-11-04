import 'package:flutter/material.dart';
import '../atoms/app_text_field.dart';
import '../atoms/primary_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppTextField(hint: "Correo electrónico"),
        const SizedBox(height: 12),
        const AppTextField(hint: "Contraseña", obscure: true),
        const SizedBox(height: 20),
        PrimaryButton(
          text: "Iniciar sesión",
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Login presionado")),
            );
          },
        ),
      ],
    );
  }
}
