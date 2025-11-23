import 'package:flutter/material.dart';

class IconActionButton extends StatelessWidget {
  final IconData icon;
  final String? label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final double iconSize;
  final double buttonSize;

  const IconActionButton({
    Key? key,
    required this.icon,
    this.label,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.iconSize = 28,
    this.buttonSize = 56,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
              color: backgroundColor ?? const Color(0xFFB7A6FA),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: iconSize,
            ),
          ),
          if (label != null) ...[
            const SizedBox(height: 8),
            Text(
              label!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

