import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:core_module/main.dart';

class KisApiService {
  final String _baseUrl = "https://openapivts.koreainvestment.com:29443"; // 모의투자 서버 URL
  String? _accessToken;

  Future<void> _getAccessToken() async {
    final url = Uri.parse('$_baseUrl/oauth2/tokenP');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'grant_type': 'client_credentials',
      'appkey': CoreModule.getKisAppKey(),
      'appsecret': CoreModule.getKisAppSecret(),
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _accessToken = data['access_token'];
      print("Access Token: $_accessToken");
    } else {
      print("Failed to get access token: ${response.statusCode} ${response.body}");
      throw Exception('Failed to get access token');
    }
  }

  Future<Map<String, dynamic>> getCurrentStockPrice(String stockCode) async {
    if (_accessToken == null) {
      await _getAccessToken();
    }

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
      return data['output'];
    } else {
      print("Failed to get stock price: ${response.statusCode} ${response.body}");
      throw Exception('Failed to get stock price');
    }
  }
}
