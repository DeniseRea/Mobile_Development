import 'package:flutter/material.dart';
import 'package:michi_app/design/molecules/header.dart';

import '../../atoms/avatar.dart';
import '../../atoms/spacing_tokens.dart';
import '../../molecules/login_form.dart';
import '../../atoms/theme_Colors.dart';

class TempLogin extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String? errorMessage;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final VoidCallback onSubmit;

  const TempLogin({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.onSubmit,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(title: 'Iniciar Sesión'),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            SizedBox(height: Spacing.xxl),
            Avatar(source: 'lib/design/assets/gifts/paw.gif', width: 130, height: 130),
            SizedBox(height: Spacing.xxl),
            Form(
              key: formKey,
              child: LoginForm(
                emailController: emailController,
                passwordController: passwordController,
                onSubmit: isLoading ? () {} : onSubmit,
              ),
            ),
            if (errorMessage != null && errorMessage!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: Spacing.sm),
                child: Text(errorMessage!, style: const TextStyle(color: ThemeColors.accent)),
              ),
            if (isLoading)
              Padding(
                padding: const EdgeInsets.only(top: Spacing.lg),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}