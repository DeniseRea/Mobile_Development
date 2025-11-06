import 'package:flutter/material.dart';
import '../atoms/app_text.dart';
import '../atoms/colors.dart';

/// InfoRow: Molécula para mostrar pares etiqueta-valor
/// 
/// Propiedades:
/// - label: etiqueta izquierda
/// - value: valor derecho
/// - valueColor: color opcional del valor
/// 
/// Ejemplo:
///   InfoRow(label: "Email", value: "user@email.com")
///   InfoRow(label: "Estado", value: "Activo", valueColor: AppColors.accent)
class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            label,
            size: 14,
            weight: FontWeight.w600,
            color: AppColors.primary,
          ),
          AppText(
            value,
            size: 14,
            weight: FontWeight.normal,
            color: valueColor ?? AppColors.secondary,
          ),
        ],
      ),
    );
  }
}
