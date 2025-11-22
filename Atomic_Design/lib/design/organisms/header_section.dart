import 'package:flutter/material.dart';
import '../atoms/app_text.dart';
import '../atoms/colors.dart';

/// HeaderSection: Organismo para encabezados de secciones
/// 
/// Propiedades:
/// - title: título principal
/// - subtitle: subtítulo opcional
/// - icon: icono opcional a mostrar
/// 
/// Ejemplo:
///   HeaderSection(title: "Mi Sección", subtitle: "Descripción aquí")
///   HeaderSection(title: "Perfil", icon: Icon(Icons.person))
class HeaderSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? icon;

  const HeaderSection({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.secondary,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 12),
              ],
              Expanded(
                child: AppText(
                  title,
                  size: 24,
                  weight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            AppText(
              subtitle!,
              size: 14,
              color: AppColors.gray,
            ),
          ],
        ],
      ),
    );
  }
}
