import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginViewModel extends ChangeNotifier {
  final SupabaseClient _supabaseClient;
  bool _isLoading = false;

  LoginViewModel(this._supabaseClient);

  bool get isLoading => _isLoading;

  Future<void> signIn(String email, String password, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _supabaseClient.auth.signInWithPassword(
        email: email.trim(),
        password: password.trim(),
      );
      if (context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      }
    } on AuthException catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message)),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An unexpected error occurred')),
        );
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
