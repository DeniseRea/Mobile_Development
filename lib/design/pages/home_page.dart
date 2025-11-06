import 'package:flutter/material.dart';
import '../atoms/app_text.dart';
import '../atoms/primary_button.dart';
import '../atoms/colors.dart';
import '../molecules/info_row.dart';
import '../templates/base_template.dart';
import 'login_page.dart';

/// HomePage: Página principal después del login exitoso
///
/// Funcionalidades:
/// - Muestra mensaje de bienvenida personalizado
/// - Información del usuario con InfoRow (molécula reutilizable)
/// - Botón para cerrar sesión
/// - Navegación de regreso a LoginPage
/// - Diseño limpio y consistente con AppColors
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// Cierra sesión y regresa a LoginPage
  void _logout(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      title: "Inicio",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Contenedor de bienvenida: fondo azul claro + borde teal
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.secondary,
                width: 2,
              ),
            ),
            child: const AppText(
              "Hola usuario, bienvenido a nuestro aplicativo",
              size: 18,
              weight: FontWeight.w600,
              color: AppColors.primary,
              align: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),

          // Sección de información del usuario - Usa molécula InfoRow
          const AppText(
            "Tu Información",
            size: 16,
            weight: FontWeight.bold,
            color: AppColors.primary,
          ),
          const SizedBox(height: 16),

          // Molécula: InfoRow reutilizable
          const InfoRow(
            label: "Email",
            value: "usuario@app.com",
            valueColor: AppColors.secondary,
          ),
          const InfoRow(
            label: "Estado",
            value: "Activo",
            valueColor: AppColors.accent,
          ),
          const InfoRow(
            label: "Sesión",
            value: "En línea",
            valueColor: AppColors.lightGreen,
          ),
          const SizedBox(height: 32),

          // Botón de cerrar sesión: color teal (secondary)
          PrimaryButton(
            text: "Cerrar Sesión",
            onPressed: () => _logout(context),
          ),
        ],
      ),
    );
  }
}