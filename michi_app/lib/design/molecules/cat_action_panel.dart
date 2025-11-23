import 'package:flutter/material.dart';

import '../atoms/icon_action_button.dart';
import '../atoms/spacing_tokens.dart';

class CatActionPanel extends StatelessWidget {
  final VoidCallback onFeed;
  final VoidCallback onPlay;
  final VoidCallback onSleep;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Color? iconColor;

  const CatActionPanel({
    Key? key,
    required this.onFeed,
    required this.onPlay,
    required this.onSleep,
    this.backgroundColor,
    this.buttonColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(Radius.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: Elevation.md,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconActionButton(
            icon: Icons.fastfood,
            label: 'Alimentar',
            onTap: onFeed,
            backgroundColor: buttonColor ?? const Color(0xFFB7A6FA),
            iconColor: iconColor ?? Colors.white,
          ),
          IconActionButton(
            icon: Icons.sports_basketball,
            label: 'Jugar',
            onTap: onPlay,
            backgroundColor: buttonColor ?? const Color(0xFFB7A6FA),
            iconColor: iconColor ?? Colors.white,
          ),
          IconActionButton(
            icon: Icons.hotel,
            label: 'Dormir',
            onTap: onSleep,
            backgroundColor: buttonColor ?? const Color(0xFFB7A6FA),
            iconColor: iconColor ?? Colors.white,
          ),
        ],
      ),
    );
  }
}

