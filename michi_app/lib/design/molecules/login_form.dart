import 'package:flutter/material.dart';

import '../atoms/app_input.dart';
import '../atoms/primary_button.dart';
import '../atoms/spacing_tokens.dart';
import '../atoms/text_label.dart';
import '../atoms/theme_Colors.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;
  final String? emailLabel;
  final String? emailHint;
  final String? passwordLabel;
  final String? passwordHint;
  final String? submitButtonText;
  final String? titleText;
  final String? subtitleText;

  const LoginForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
    this.emailLabel = 'Email',
    this.emailHint = 'correo@ejemplo.com',
    this.passwordLabel = 'Contraseña',
    this.passwordHint = '••••••••',
    this.submitButtonText = 'Entrar',
    this.titleText = 'Bienvenido',
    this.subtitleText = 'Ingresa tus datos para continuar',
  }) : super(key: key);

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El email es requerido';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Ingrese un email válido';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es requerida';
    }
    if (value.length < 6) {
      return 'Mínimo 6 caracteres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null)
          Headline(
            titleText!,
            fontSize: FontSize.xxl.toDouble(),
            fontWeight: FontWeight.w700,
          ),
        if (titleText != null) SizedBox(height: Spacing.lg),
        if (subtitleText != null)
          TextLabel(
            subtitleText!,
            fontSize: FontSize.md.toDouble(),
            color: ThemeColors.soft2,
          ),
        if (subtitleText != null) SizedBox(height: Spacing.lg),
        AppInput(
          controller: emailController,
          label: emailLabel!,
          hint: emailHint!,
          keyboardType: TextInputType.emailAddress,
          validator: _emailValidator,
        ),
        SizedBox(height: Spacing.md),
        AppInput(
          controller: passwordController,
          label: passwordLabel!,
          hint: passwordHint!,
          obscure: true,
          validator: _passwordValidator,
        ),
        SizedBox(height: Spacing.lg),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            text: submitButtonText!,
            onTap: onSubmit,
          ),
        ),
      ],
    );
  }
}

