import 'package:flutter/material.dart';
import 'package:core_module/data/models/stock_info.dart';

class StocksDetailsViewModel extends ChangeNotifier {
  String stockName;
  String stockPrice;
  String stockChange;
  Color stockChangeColor;

  StocksDetailsViewModel({required StockInfo stock}) 
      : stockName = stock.name,
        stockPrice = '\${stock.currentPrice.toStringAsFixed(2)}',
        stockChange = '${stock.changeRate >= 0 ? '+' : ''}${stock.changeRate.toStringAsFixed(2)}%',
        stockChangeColor = stock.changeRate >= 0 ? Colors.green : Colors.red;

  // You can add methods here to fetch data from services or update state
}
