import 'package:flutter/material.dart';
import '../atoms/progress_bar.dart';
import '../atoms/spacing_tokens.dart';
import '../atoms/text_label.dart';
import '../atoms/theme_Colors.dart';

class CatStatus extends StatelessWidget {
  final double happiness;
  final double hunger;
  final double energy;
  final Color? happinessColor;
  final Color? hungerColor;
  final Color? energyColor;
  final String? titleText;

  const CatStatus({
    Key? key,
    required this.happiness,
    required this.hunger,
    required this.energy,
    this.happinessColor,
    this.hungerColor,
    this.energyColor,
    this.titleText = 'Estado del gatito',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: ThemeColors.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ThemeColors.soft1.withOpacity(0.2),
            blurRadius: Elevation.md,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleText != null)
            TextLabel(
              titleText!,
              fontSize: FontSize.lg.toDouble(),
              fontWeight: FontWeight.w600,
            ),
          if (titleText != null) SizedBox(height: Spacing.md),
          ProgressBar(
            label: 'Felicidad',
            value: happiness,
            color: happinessColor ?? Colors.pink,
          ),
          SizedBox(height: Spacing.md),
          ProgressBar(
            label: 'Hambre',
            value: hunger,
            color: hungerColor ?? Colors.orange,
          ),
          SizedBox(height: Spacing.md),
          ProgressBar(
            label: 'Energía',
            value: energy,
            color: energyColor ?? Colors.green,
          ),
        ],
      ),
    );
  }
}

