import 'package:core_module/data/models/stock_info.dart';

abstract class KisApiRepository {
  Future<String> getAccessToken();
  Future<StockInfo> getCurrentStockPrice(String stockCode);
  Future<List<StockInfo>> getDailyStockPrice(String stockCode, String startDate, String endDate);
  Future<Map<String, dynamic>> placeOrder({
    required String stockCode,
    required String orderType,
    required int quantity,
    required double price,
  });
  Future<Map<String, dynamic>> getAccountBalance(String accountNumber);
}
