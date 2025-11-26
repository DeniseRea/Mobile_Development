import 'package:flutter/material.dart';
import 'package:michi_app/design/molecules/cat_display.dart';
import 'package:michi_app/design/molecules/cat_status.dart';
import 'package:michi_app/design/molecules/cat_action_panel.dart';


class CatTemplate extends StatelessWidget {
  final String? nombre;
  final String catName;
  final String gifSource;
  final double happiness;
  final double hunger;
  final double energy;
  final VoidCallback onFeed;
  final VoidCallback onPlay;
  final VoidCallback onSleep;
  final VoidCallback? onLogout;

  const CatTemplate({
    super.key,
    this.nombre,
    required this.catName,
    required this.gifSource,
    required this.happiness,
    required this.hunger,
    required this.energy,
    required this.onFeed,
    required this.onPlay,
    required this.onSleep,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Michi App'),
        actions: [
          if (onLogout != null)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: onLogout,
              tooltip: 'Cerrar sesión',
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 1. Label de saludo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hola ${nombre ?? ""}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            // 2. Cat Display
            CatDisplay(
              catName: catName,
              gifSource: gifSource,
            ),

            // 3. Cat Status
            CatStatus(
              happiness: happiness,
              hunger: hunger,
              energy: energy,
            ),

            // 4. Cat Action Panel
            CatActionPanel(
              onFeed: onFeed,
              onPlay: onPlay,
              onSleep: onSleep,
            ),
          ],
        ),
      ),
    );
  }
}
