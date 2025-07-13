import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:core_module/main.dart';
import 'package:core_module/data/models/stock_info.dart';
import 'package:core_module/domain/repositories/kis_api_repository.dart';

class KisApiService implements KisApiRepository {
  final String _baseUrl = "https://openapivts.koreainvestment.com:29443"; // 모의투자 서버 URL
  String? _accessToken;

  @override
  Future<String> getAccessToken() async {
    if (_accessToken != null) return _accessToken!;

    int retryCount = 0;
    const maxRetries = 3;
    const delaySeconds = 5;

    while (retryCount < maxRetries) {
      final url = Uri.parse('$_baseUrl/oauth2/tokenP');
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({
        'grant_type': 'client_credentials',
        'appkey': CoreModule.getKisAppKey(),
        'appsecret': CoreModule.getKisAppSecret(),
      });

      try {
        final response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          _accessToken = data['access_token'];
          print("Access Token: $_accessToken");
          return _accessToken!;
        } else {
          print("Failed to get access token: ${response.statusCode} ${response.body}");
          if (response.statusCode == 403 && response.body.contains("EGW00133")) {
            // Rate limit exceeded, retry after delay
            print("Rate limit exceeded for access token. Retrying in $delaySeconds seconds...");
            await Future.delayed(Duration(seconds: delaySeconds));
            retryCount++;
          } else {
            throw Exception('Failed to get access token');
          }
        }
      } catch (e) {
        print("Error getting access token: $e");
        retryCount++;
        if (retryCount < maxRetries) {
          print("Retrying in $delaySeconds seconds...");
          await Future.delayed(Duration(seconds: delaySeconds));
        }
      }
    }
    throw Exception('Failed to get access token after multiple retries');
  }

  @override
  Future<StockInfo> getCurrentStockPrice(String stockCode) async {
    await _ensureAccessToken();

    final url = Uri.parse('$_baseUrl/uapi/domestic-stock/v1/quotations/inquire-price?fid_cond_mrkt_div_code=J&fid_input_iscd=$stockCode');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $_accessToken',
      'appkey': CoreModule.getKisAppKey(),
      'appsecret': CoreModule.getKisAppSecret(),
      'tr_id': 'FHKST01010100', // 주식 현재가 시세
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Stock price API response: ${response.body}");
      // Assuming the API returns a structure like { "output": { "stck_prpr": "10000", "stck_nm": "삼성전자", ... } }
      return StockInfo(
        code: stockCode,
        name: stockCode, // 임시로 주식 코드를 이름으로 사용
        currentPrice: double.parse(data['output']['stck_prpr'] ?? '0'),
        changeRate: double.parse(data['output']['prdy_ctrt'] ?? '0'), // 전일 대비율
      );
    } else {
      print("Failed to get stock price: ${response.statusCode} ${response.body}");
      throw Exception('Failed to get stock price');
    }
  }

  @override
  Future<List<StockInfo>> getDailyStockPrice(String stockCode, String startDate, String endDate) async {
    await _ensureAccessToken();

    // This is a placeholder URL and logic. Actual API endpoint and parameters will vary.
    final url = Uri.parse('$_baseUrl/uapi/domestic-stock/v1/quotations/daily-price?fid_cond_mrkt_div_code=J&fid_input_iscd=$stockCode&fid_period_div_code=D&fid_org_adj_prc=1');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $_accessToken',
      'appkey': CoreModule.getKisAppKey(),
      'appsecret': CoreModule.getKisAppSecret(),
      'tr_id': 'FHKST01010200', // 주식 일별 시세
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Assuming the API returns a list of daily prices
      List<StockInfo> dailyPrices = [];
      for (var item in data['output']) {
        dailyPrices.add(StockInfo(
          code: stockCode,
          name: item['stck_nm'] ?? '',
          currentPrice: double.parse(item['stck_clpr'] ?? '0'), // 종가
          changeRate: double.parse(item['prdy_ctrt'] ?? '0'), // 전일 대비율
        ));
      }
      return dailyPrices;
    } else {
      print("Failed to get daily stock price: ${response.statusCode} ${response.body}");
      throw Exception('Failed to get daily stock price');
    }
  }

  @override
  Future<Map<String, dynamic>> placeOrder({
    required String stockCode,
    required String orderType,
    required int quantity,
    required double price,
  }) async {
    await _ensureAccessToken();

    // This is a placeholder URL and logic. Actual API endpoint and parameters will vary.
    final url = Uri.parse('$_baseUrl/uapi/domestic-stock/v1/trading/order');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $_accessToken',
      'appkey': CoreModule.getKisAppKey(),
      'appsecret': CoreModule.getKisAppSecret(),
      'tr_id': 'VTTC0802U', // 주식 현금 주문
    };
    final body = jsonEncode({
      'CANO': 'YOUR_ACCOUNT_NUMBER', // 실제 계좌번호로 대체 필요
      'ACNT_PRDT_CD': '01', // 계좌 상품 코드
      'PDNO': stockCode,
      'ORD_DVSN': orderType, // 01: 지정가, 02: 시장가 등
      'ORD_QTY': quantity.toString(),
      'ORD_UNPR': price.toString(),
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      print("Failed to place order: ${response.statusCode} ${response.body}");
      throw Exception('Failed to place order');
    }
  }

  @override
  Future<Map<String, dynamic>> getAccountBalance(String accountNumber) async {
    await _ensureAccessToken();

    // This is a placeholder URL and logic. Actual API endpoint and parameters will vary.
    final url = Uri.parse('$_baseUrl/uapi/domestic-stock/v1/trading/inquire-balance?CANO=$accountNumber&ACNT_PRDT_CD=01');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $_accessToken',
      'appkey': CoreModule.getKisAppKey(),
      'appsecret': CoreModule.getKisAppSecret(),
      'tr_id': 'VTTC8436R', // 주식 잔고 조회
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      print("Failed to get account balance: ${response.statusCode} ${response.body}");
      throw Exception('Failed to get account balance');
    }
  }

  Future<void> _ensureAccessToken() async {
    if (_accessToken == null) {
      await getAccessToken();
    }
  }

  @override
  Future<String> getStockName(String stockCode) async {
    await _ensureAccessToken();

    final url = Uri.parse('$_baseUrl/uapi/domestic-stock/v1/quotations/search-stock-info?fid_input_iscd=$stockCode');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $_accessToken',
      'appkey': CoreModule.getKisAppKey(),
      'appsecret': CoreModule.getKisAppSecret(),
      'tr_id': 'CTPF1002R', // 종목 정보 검색
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Stock name API response: ${response.body}");
      // Assuming the API returns a list of stocks and we take the first one's name
      if (data['output'] != null && data['output'].isNotEmpty) {
        return data['output'][0]['item_name'] ?? stockCode; // 'item_name'은 가상의 필드명
      } else {
        return stockCode; // No name found, return stock code
      }
    } else {
      print("Failed to get stock name: ${response.statusCode} ${response.body}");
      throw Exception('Failed to get stock name');
    }
  }
}
