import 'package:flutter/material.dart';
import 'package:core_module/data/models/stock_info.dart';
import 'package:core_module/services/kis_api_service.dart';

class StocksViewModel extends ChangeNotifier {
  final KisApiService _kisApiService;
  List<StockInfo> recommendedStocks = [];
  bool isLoading = false;
  String? errorMessage;

  StocksViewModel(this._kisApiService);

  Future<void> fetchRecommendedStocks() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _kisApiService.getAccessToken(); // Ensure access token is obtained before fetching stock prices
      // For demonstration, fetching a few hardcoded stock prices.
      // In a real scenario, this would come from an AI model or a predefined list.
      final stockCodes = ['005930', '000660', '035720']; // 삼성전자, SK하이닉스, 카카오
      List<StockInfo> fetchedStocks = [];

      for (var code in stockCodes) {
        final stockInfo = await _kisApiService.getCurrentStockPrice(code);
        final stockName = await _kisApiService.getStockName(code);
        fetchedStocks.add(StockInfo(
          code: stockInfo.code,
          name: stockName,
          currentPrice: stockInfo.currentPrice,
          changeRate: stockInfo.changeRate,
        ));
        await Future.delayed(Duration(milliseconds: 500)); // Add a delay to avoid rate limiting
      }
      recommendedStocks = fetchedStocks;
    } catch (e) {
      errorMessage = 'Failed to load stocks: ${e.toString()}';
      print(errorMessage);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
