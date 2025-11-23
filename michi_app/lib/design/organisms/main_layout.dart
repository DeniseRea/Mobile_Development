import 'package:flutter/material.dart';
import 'package:michi_app/design/molecules/molecules.dart';
import 'package:michi_app/design/organisms/bottom_nav_bar.dart';

class MainLayout extends StatefulWidget {
  final List<BottomNavItem> pages;
  final int initialIndex;
  final Header? header;
  final Color? backgroundColor;

  const MainLayout({
    Key? key,
    required this.pages,
    this.initialIndex = 0,
    this.header,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _handleNavigation(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.header,
      backgroundColor: widget.backgroundColor ?? const Color(0xFFF5FBF9),
      body: widget.pages[_currentIndex].page,
      bottomNavigationBar: BottomNavBar(
        items: widget.pages,
        initialIndex: _currentIndex,
        onNavigate: _handleNavigation,
      ),
    );
  }
}

