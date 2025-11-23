import 'package:flutter/material.dart';

import '../atoms/avatar.dart';
import '../atoms/icon_action_button.dart';
import '../atoms/spacing_tokens.dart';
import '../atoms/text_label.dart';

class UserSwitcher extends StatelessWidget {
  final String userName;
  final String avatarSource;
  final bool isAsset;
  final VoidCallback onSwitch;
  final double avatarSize;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? buttonColor;
  final IconData switchIcon;

  const UserSwitcher({
    Key? key,
    required this.userName,
    required this.avatarSource,
    required this.onSwitch,
    this.isAsset = true,
    this.avatarSize = 48,
    this.backgroundColor,
    this.borderColor,
    this.buttonColor,
    this.switchIcon = Icons.swap_horiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.md,
        vertical: Spacing.sm,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(Radius.md),
        border: Border.all(
          color: borderColor ?? Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Avatar(
            source: avatarSource,
            isAsset: isAsset,
            width: avatarSize,
            height: avatarSize,
            borderRadius: BorderRadius.circular(Radius.md),
          ),
          SizedBox(width: Spacing.md),
          Expanded(
            child: TextLabel(
              userName,
              fontSize: FontSize.md.toDouble(),
              fontWeight: FontWeight.w600,
            ),
          ),
          IconActionButton(
            icon: switchIcon,
            onTap: onSwitch,
            backgroundColor: buttonColor ?? const Color(0xFFB7A6FA),
            iconColor: Colors.white,
            iconSize: 20,
            buttonSize: 32,
          ),
        ],
      ),
    );
  }
}

