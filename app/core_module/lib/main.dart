import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CoreModule {
  static Future<void> init() async {
    print("Loading .env file...");
    await dotenv.load(fileName: "packages/core_module/.env");
    print("Env loaded. SUPABASE_URL: ${dotenv.env['SUPABASE_URL']}");

    print("Initializing Supabase...");
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    );
    print("Supabase initialized.");
  }

  static String getSupabaseUrl() {
    return dotenv.env['SUPABASE_URL']!;
  }

  static String getSupabaseAnonKey() {
    return dotenv.env['SUPABASE_ANON_KEY']!;
  }

  static String getKisAppKey() {
    return dotenv.env['KIS_APP_KEY']!;
  }

  static String getKisAppSecret() {
    return dotenv.env['KIS_APP_SECRET']!;
  }
}
