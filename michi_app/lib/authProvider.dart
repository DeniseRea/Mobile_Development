import 'package:flutter/foundation.dart';

class MockUser {
  final String email;
  final String password;
  final String name;

  const MockUser({required this.email, required this.password, required this.name});
}

class AuthProvider extends ChangeNotifier {
  final List<MockUser> _mockUsers = const [
    MockUser(email: 'deni@espe.com', password: 'denise123', name: 'Denise'),
    MockUser(email: 'noemi@yoto.com', password: 'noemi123', name: 'Noemi'),
  ];

  bool _isLoading = false;
  MockUser? _currentUser;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  MockUser? get user => _currentUser;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    if (_isLoading) return false;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Simula una llamada a servidor
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final found = _mockUsers.firstWhere(
            (u) => u.email == email && u.password == password,
        orElse: () => throw Exception('Credenciales inválidas'),
      );
      _currentUser = found;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _currentUser = null;
      _errorMessage = 'Credenciales inválidas';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }


  List<MockUser> get mockUsers => List.unmodifiable(_mockUsers);

  /// Updates the current authenticated user's name and notifies listeners.
  /// Returns true if a user was updated, false otherwise.
  bool changeName(String newName) {
    if (_currentUser == null) return false;
    _currentUser = MockUser(
      email: _currentUser!.email,
      password: _currentUser!.password,
      name: newName,
    );
    notifyListeners();
    return true;
  }
}