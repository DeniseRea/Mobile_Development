import 'package:flutter/material.dart';

import '../atoms/avatar.dart';
import '../atoms/spacing_tokens.dart';
import '../atoms/text_label.dart';
import '../atoms/theme_Colors.dart';

class CatDisplay extends StatelessWidget {
  final String catName;
  final String gifSource;
  final bool isAsset;
  final double? gifWidth;
  final double? gifHeight;
  final Color? containerColor;
  final double? nameSize;
  final Color? nameColor;

  const CatDisplay({
    Key? key,
    required this.catName,
    required this.gifSource,
    this.isAsset = true,
    this.gifWidth,
    this.gifHeight,
    this.containerColor,
    this.nameSize,
    this.nameColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: containerColor ?? ThemeColors.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ThemeColors.soft1.withOpacity(0.2),
            blurRadius: Elevation.md,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Avatar(
            source: gifSource,
            isAsset: isAsset,
            width: gifWidth ?? 180,
            height: gifHeight ?? 180,
            borderRadius: BorderRadius.circular(Radius.lg),
          ),
          SizedBox(height: Spacing.lg),
          Headline(
            catName,
            fontSize: nameSize ?? FontSize.xl.toDouble(),
            fontWeight: FontWeight.w700,
            color: nameColor,
          ),
        ],
      ),
    );
  }
}

