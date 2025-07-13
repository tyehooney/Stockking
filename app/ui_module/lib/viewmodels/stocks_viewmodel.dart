import 'package:flutter/material.dart';

class StocksViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> recommendedStocks = [
    {'name': 'Samsung Electronics', 'change': '+1.5%'},
    {'name': 'SK Hynix', 'change': '-0.8%'},
    {'name': 'LG Chem', 'change': '+2.1%'},
    {'name': 'Naver', 'change': '+0.5%'},
    {'name': 'Kakao', 'change': '-1.2%'},
  ];

  // You can add methods here to fetch data from services or update state
}
