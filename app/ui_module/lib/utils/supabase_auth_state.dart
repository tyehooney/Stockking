import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A mixin to handle Supabase authentication state changes.
/// This mixin should be used with a StatefulWidget.
mixin SupabaseAuthState<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      if (event == AuthChangeEvent.signedIn) {
        onAuthenticated(session!);
      } else if (event == AuthChangeEvent.signedOut) {
        onUnauthenticated();
      } else if (event == AuthChangeEvent.initialSession) {
        if (session == null) {
          onUnauthenticated();
        } else {
          onAuthenticated(session);
        }
      } else if (event == AuthChangeEvent.userUpdated) {
        onAuthenticated(session!);
      } else if (event == AuthChangeEvent.passwordRecovery) {
        // Handle password recovery if needed
      } else if (event == AuthChangeEvent.userDeleted) {
        onUnauthenticated();
      } else if (event == AuthChangeEvent.tokenRefreshed) {
        onAuthenticated(session!);
      }
    }, onError: (error) {
      if (error is AuthException) {
        onAPIError(error);
      } else {
        // Handle other types of errors if necessary
      }
    });
  }

  /// Called when the user is authenticated.
  void onAuthenticated(Session session);

  /// Called when the user is unauthenticated.
  void onUnauthenticated();

  /// Called when an API error occurs during authentication.
  void onAPIError(AuthException error);
}