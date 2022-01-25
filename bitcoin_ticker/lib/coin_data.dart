import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const BITCOIN_URL = "https://rest.coinapi.io/v1/exchangerate";

class CoinData {
  /**
   * @param: symbol - ticker symbol for the selected bitcoin+currency
   * @param: symbolSet - default global but can change to local, crypto, or tokens
   * @return the currency price of a single bitcoin/litecoin/ethereum
   */
  Future<String> getCoinData(String coinSymbol, String currencySymbol, {String symbolSet = 'global'}) async {
    String url = "$BITCOIN_URL/$coinSymbol/$currencySymbol";
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri, headers: { 'X-CoinAPI-Key': dotenv.env['COIN_API_KEY'] });
    if (response.statusCode == HttpStatus.ok) {
      dynamic responseBody = jsonDecode(response.body);
      double rate = responseBody['rate'];
      rate = (rate * 100.0).round() / 100.0;
      return rate.toString();
    }
    return null;
  }
}
