import 'package:http/http.dart' as http;
import 'dart:convert';

class Database{
  String api = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=";
  String key = "00280d57-72e8-4d65-b9dd-d5a4410dec58";

  Future<List<String>> getCurrency() async {
    try {
      var response = await http.get(Uri.encodeFull(api + key),
          headers: {"Accept": "application/json"});
      print('datalist Response: ${response.body}');
      if (200 == response.statusCode) {
        List<dynamic> list = json.decode(response.body);
        return list;
      } else {
        return List<String>();
      }
    } catch (e) {
      return List<String>(); // return an empty list on exception/error
    }
  }
}