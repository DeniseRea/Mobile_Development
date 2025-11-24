import 'package:flutter/material.dart';

import '../../atoms/avatar.dart';
import '../../atoms/spacing_tokens.dart';
import '../../molecules/login_form.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            SizedBox(height: Spacing.xxl),
            Avatar(source: 'assets/images/cat.gif', width: 120, height: 120),
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
                child: Text(errorMessage!, style: const TextStyle(color: Colors.red)),
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