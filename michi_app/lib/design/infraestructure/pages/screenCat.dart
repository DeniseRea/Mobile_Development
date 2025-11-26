import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:michi_app/authProvider.dart';
import '../templates/cat_template.dart';

class CatPage extends StatefulWidget {
  const CatPage({super.key});

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  // Estados del gato
  double _happiness = 50.0;
  double _hunger = 50.0;
  double _energy = 50.0;

  // Información del gato
  final String _catName = 'Chimuelo';

  // Lista de GIFs disponibles locales
  final List<String> _availableGifs = [
    'lib/design/assets/gifts/cat1.gif',
    'lib/design/assets/gifts/cat2.gif',
  ];

  late String _currentGif;

  @override
  void initState() {
    super.initState();
    // Inicializar con el primer GIF disponible
    _currentGif = _availableGifs[0];
  }

  // Método para seleccionar un GIF basado en el estado del gato
  String _selectGifByState() {
    if (_energy < 20) {
      return _availableGifs[1]; // GIF durmiendo
    }
    return _availableGifs[0]; // GIF normal
  }

  // Métodos para las acciones
  void _handleFeed() {
    setState(() {
      // Alimentar reduce el hambre y aumenta la felicidad
      _hunger = (_hunger - 20).clamp(0, 100);
      _happiness = (_happiness + 10).clamp(0, 100);
      _energy = (_energy - 5).clamp(0, 100);
      _currentGif = _selectGifByState();
    });

    _showFeedback('¡Michi ha comido! 🍖');
  }

  void _handlePlay() {
    setState(() {
      // Jugar aumenta la felicidad pero reduce energía y aumenta hambre
      _happiness = (_happiness + 20).clamp(0, 100);
      _energy = (_energy - 15).clamp(0, 100);
      _hunger = (_hunger + 10).clamp(0, 100);
      _currentGif = _selectGifByState();
    });

    _showFeedback('¡Chimuelo está jugando! 🎾');
  }

  void _handleSleep() {
    setState(() {
      // Dormir aumenta la energía y reduce el hambre
      _energy = (_energy + 30).clamp(0, 100);
      _hunger = (_hunger + 5).clamp(0, 100);
      _happiness = (_happiness + 5).clamp(0, 100);
      _currentGif = _selectGifByState();
    });

    _showFeedback('¡Chimuelo está durmiendo! 😴');
  }

  void _showFeedback(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _handleLogout() {
    final auth = context.read<AuthProvider>();
    auth.logout();
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    // Obtener el nombre del usuario desde AuthProvider
    final authProvider = context.watch<AuthProvider>();
    final userName = authProvider.user?.name ?? 'Usuario';

    return CatTemplate(
      nombre: userName,
      catName: _catName,
      gifSource: _currentGif,
      happiness: _happiness,
      hunger: _hunger,
      energy: _energy,
      onFeed: _handleFeed,
      onPlay: _handlePlay,
      onSleep: _handleSleep,
      onLogout: _handleLogout,
    );
  }
}


