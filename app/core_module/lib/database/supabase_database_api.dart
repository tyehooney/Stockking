import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:core_module/database/database_api.dart';

class SupabaseDatabaseApi implements DatabaseApi {
  final SupabaseClient _supabaseClient;

  SupabaseDatabaseApi(String supabaseUrl, String supabaseAnonKey)
      : _supabaseClient = SupabaseClient(supabaseUrl, supabaseAnonKey);

  // User Table Operations
  @override
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> userData) async {
    final response = await _supabaseClient.from('users').insert(userData).select().single();
    return response;
  }

  @override
  Future<Map<String, dynamic>?> getUser(String userId) async {
    final response = await _supabaseClient.from('users').select().eq('id', userId).single();
    return response;
  }

  @override
  Future<Map<String, dynamic>> updateUser(String userId, Map<String, dynamic> updates) async {
    final response = await _supabaseClient.from('users').update(updates).eq('id', userId).select().single();
    return response;
  }

  @override
  Future<void> deleteUser(String userId) async {
    await _supabaseClient.from('users').delete().eq('id', userId);
  }

  // Invest History Table Operations
  @override
  Future<Map<String, dynamic>> createInvestHistory(Map<String, dynamic> historyData) async {
    final response = await _supabaseClient.from('invest_history').insert(historyData).select().single();
    return response;
  }

  @override
  Future<List<Map<String, dynamic>>> getInvestHistory(String userId) async {
    final response = await _supabaseClient.from('invest_history').select().eq('user_id', userId);
    return response;
  }

  @override
  Future<Map<String, dynamic>> updateInvestHistory(String historyId, Map<String, dynamic> updates) async {
    final response = await _supabaseClient.from('invest_history').update(updates).eq('id', historyId).select().single();
    return response;
  }

  @override
  Future<void> deleteInvestHistory(String historyId) async {
    await _supabaseClient.from('invest_history').delete().eq('id', historyId);
  }
}