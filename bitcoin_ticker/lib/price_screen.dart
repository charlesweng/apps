import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  String btcPrice = "?";
  String ltcPrice = "?";
  String ethPrice = "?";
  CoinData coinData = CoinData();

  CupertinoPicker iosPicker() {
    return CupertinoPicker(
                  backgroundColor: Colors.lightBlue,
                  itemExtent: 32.0,
                  onSelectedItemChanged: (selectedIndex) async {
                    setState(() {
                      selectedCurrency = currenciesList[selectedIndex];
                    });
                    String btc = await coinData.getCoinData("BTC", selectedCurrency);
                    String ltc = await coinData.getCoinData("LTC", selectedCurrency);
                    String eth = await coinData.getCoinData("ETH", selectedCurrency);
                    setState(() {
                      btcPrice = btc;
                      ltcPrice = ltc;
                      ethPrice = eth;
                    });
                  },
                  children: currenciesList.map((e) => Text(e)).toList());
  }

  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
        value: selectedCurrency,
        onChanged: (val) async {
          setState(() {
            selectedCurrency = val;
          });
          String btc = await coinData.getCoinData("BTC", selectedCurrency);
          String ltc = await coinData.getCoinData("LTC", selectedCurrency);
          String eth = await coinData.getCoinData("ETH", selectedCurrency);
          setState(() {
            btcPrice = btc;
            ltcPrice = ltc;
            ethPrice = eth;
          });
        },
        items: currenciesList
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ReusableCard(coinSymbol: "BTC", selectedCurrency: selectedCurrency, coinPrice: btcPrice),
          ReusableCard(coinSymbol: "LTC", selectedCurrency: selectedCurrency, coinPrice: ltcPrice),
          ReusableCard(coinSymbol: "ETH", selectedCurrency: selectedCurrency, coinPrice: ethPrice),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isIOS ? iosPicker() : androidDropdown()),
        ],
      ),
    );
  }
}
