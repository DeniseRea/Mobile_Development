import 'package:flutter/material.dart';

import '../atoms/spacing_tokens.dart';
import '../atoms/text_label.dart';


class BottomNavBar extends StatefulWidget {
  final List<BottomNavItem> items;
  final int initialIndex;
  final Function(int) onNavigate;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;

  const BottomNavBar({
    Key? key,
    required this.items,
    this.initialIndex = 0,
    required this.onNavigate,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: Elevation.md,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.sm,
            vertical: Spacing.sm,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              widget.items.length,
              (index) => _buildNavItem(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final isActive = _currentIndex == index;
    final item = widget.items[index];

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        widget.onNavigate(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(Spacing.sm),
            decoration: BoxDecoration(
              color: isActive
                  ? (widget.activeColor ?? const Color(0xFFB7A6FA)).withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(Radius.md),
            ),
            child: Icon(
              item.icon,
              color: isActive
                  ? (widget.activeColor ?? const Color(0xFFB7A6FA))
                  : (widget.inactiveColor ?? Colors.grey.shade400),
              size: 28,
            ),
          ),
          SizedBox(height: Spacing.xs),
          TextLabel(
            item.label,
            fontSize: FontSize.xs.toDouble(),
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive
                ? (widget.activeColor ?? const Color(0xFFB7A6FA))
                : (widget.inactiveColor ?? Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem {
  final IconData icon;
  final String label;
  final Widget page;

  BottomNavItem({
    required this.icon,
    required this.label,
    required this.page,
  });
}

