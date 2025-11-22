import 'package:flutter/material.dart';
import '../atoms/app_text.dart';
import '../atoms/colors.dart';
import '../atoms/primary_button.dart';
import '../atoms/app_text_field.dart';
import '../templates/base_template.dart';
import 'home_page.dart';

/// LoginPage: Página de autenticación inicial
/// 
/// Estructura:
/// - AppBar con título "Iniciar Sesión"
/// - Título: "Bienvenido"
/// - Subtítulo con instrucciones
/// - Campos: Email y Contraseña
/// - Botón: Ingresar (navega a HomePage)
/// 
/// Flujo: LoginPage → HomePage (tras login exitoso)
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  /// Navega a HomePage tras autenticación exitosa
  void _onLoginSuccess(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      title: "Iniciar Sesión",
      child: _buildLoginForm(),
    );
  }

  /// Construye el formulario de login con título, campos y botón
  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Encabezado
        const AppText(
          "Bienvenido",
          size: 28,
          weight: FontWeight.bold,
          color: AppColors.primary,
        ),
        const SizedBox(height: 8),
        const AppText(
          "Ingrese sus credenciales para continuar",
          size: 14,
          weight: FontWeight.w400,
          color: AppColors.gray,
        ),
        const SizedBox(height: 32),

        // Campos de entrada
        const AppTextField(hint: "Correo electrónico"),
        const SizedBox(height: 12),
        const AppTextField(hint: "Contraseña", obscure: true),
        const SizedBox(height: 24),

        // Botón de envío
        Builder(
          builder: (context) => PrimaryButton(
            text: "Iniciar sesión",
            onPressed: () {
              // Mostrar feedback
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("¡Bienvenido!"),
                  backgroundColor: AppColors.secondary,
                ),
              );
              // Navegar después de breve delay
              Future.delayed(
                const Duration(milliseconds: 500),
                () => _onLoginSuccess(context),
              );
            },
          ),
        ),
      ],
    );
  }
}