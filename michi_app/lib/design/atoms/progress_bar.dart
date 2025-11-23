import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final String label;
  final double value;
  final double maxValue;
  final Color? color;
  final Color? backgroundColor;
  final double height;

  const ProgressBar({
    Key? key,
    required this.label,
    required this.value,
    this.maxValue = 100,
    this.color,
    this.backgroundColor,
    this.height = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentage = (value / maxValue).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${(percentage * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: percentage,
            minHeight: height,
            backgroundColor: backgroundColor ?? Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

