import 'package:flutter/material.dart';

class StocksDetailsViewModel extends ChangeNotifier {
  // Placeholder for stock details data
  String stockName = 'Tech Innovators Inc.';
  String stockPrice = '\$150.00';
  String stockChange = '+2.3%';
  Color stockChangeColor = Colors.green;

  // You can add methods here to fetch data from services or update state
}
