abstract class DatabaseApi {
  // User Table Operations
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> userData);
  Future<Map<String, dynamic>?> getUser(String userId);
  Future<Map<String, dynamic>> updateUser(String userId, Map<String, dynamic> updates);
  Future<void> deleteUser(String userId);

  // Invest History Table Operations
  Future<Map<String, dynamic>> createInvestHistory(Map<String, dynamic> historyData);
  Future<List<Map<String, dynamic>>> getInvestHistory(String userId);
  Future<Map<String, dynamic>> updateInvestHistory(String historyId, Map<String, dynamic> updates);
  Future<void> deleteInvestHistory(String historyId);
}