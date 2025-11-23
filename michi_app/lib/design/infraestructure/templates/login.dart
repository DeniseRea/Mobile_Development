import 'package:flutter/material.dart';
import 'package:michi_app/design/atoms/avatar.dart';
import 'package:michi_app/design/atoms/snackbar_helper.dart';
import 'package:michi_app/design/atoms/spacing_tokens.dart';
import 'package:michi_app/design/molecules/molecules.dart';

class LoginTemplate extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginTemplate({
    Key? key,
    required this.onLoginSuccess,
  }) : super(key: key);

  @override
  State<LoginTemplate> createState() => _LoginTemplateState();
}

class _LoginTemplateState extends State<LoginTemplate> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'El correo es requerido';
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Ingresa un correo válido';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es requerida';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  void _handleLogin() {
    // Validar campos
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      SnackbarHelper.showError(context, message: 'Completa todos los campos');
      return;
    }

    // Validar email
    if (_validateEmail(emailController.text) != null) {
      SnackbarHelper.showError(
        context,
        message: _validateEmail(emailController.text)!,
      );
      return;
    }

    // Validar password
    if (_validatePassword(passwordController.text) != null) {
      SnackbarHelper.showError(
        context,
        message: _validatePassword(passwordController.text)!,
      );
      return;
    }

    // Simular login (aquí irá la llamada a API)
    setState(() {
      _isLoading = true;
    });

    // Simulamos una llamada al servidor (500ms)
    Future.delayed(const Duration(milliseconds: 500)).then((_) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        SnackbarHelper.showSuccess(context, message: '¡Bienvenido!');
        widget.onLoginSuccess();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            SizedBox(height: Spacing.xxl),
            Avatar(
              source: 'assets/images/cat.gif',
              width: 120,
              height: 120,
            ),
            SizedBox(height: Spacing.xxl),
            // Molécula LoginForm - sin lógica, solo presentación
            LoginForm(
              emailController: emailController,
              passwordController: passwordController,
              onSubmit: _isLoading ? () {} : _handleLogin,
            ),
            if (_isLoading)
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
