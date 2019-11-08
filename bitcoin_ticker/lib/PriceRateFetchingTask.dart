import 'package:http/http.dart' as http;
import 'dart:convert';
class PriceRateFetchingTask
{

  Future<String> fetchPriceRate(String currency) async
  {
    String url = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC$currency";
    http.Response response = await http.get(url);
    String responseJSON = response.body;

    var jsonDecodedValue = jsonDecode(responseJSON);
    var lastPrice = jsonDecodedValue['last'];
    return lastPrice.toString();

  }

}