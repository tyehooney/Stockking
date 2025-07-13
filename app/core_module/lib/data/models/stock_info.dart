class StockInfo {
  final String code;
  final String name;
  final double currentPrice;
  final double changeRate;

  StockInfo({
    required this.code,
    required this.name,
    required this.currentPrice,
    required this.changeRate,
  });

  factory StockInfo.fromJson(Map<String, dynamic> json) {
    return StockInfo(
      code: json['code'],
      name: json['name'],
      currentPrice: double.parse(json['currentPrice'].toString()),
      changeRate: double.parse(json['changeRate'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'currentPrice': currentPrice,
      'changeRate': changeRate,
    };
  }
}
