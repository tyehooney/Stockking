import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupViewModel extends ChangeNotifier {
  final SupabaseClient _supabaseClient;
  bool _isLoading = false;

  SignupViewModel(this._supabaseClient);

  bool get isLoading => _isLoading;

  Future<void> signUp(String email, String password, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _supabaseClient.auth.signUp(
        email: email.trim(),
        password: password.trim(),
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign up successful! Please check your email for verification.')),
        );
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
