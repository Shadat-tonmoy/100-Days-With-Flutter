import 'package:bitcoin_ticker/PriceRateFetchingTask.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter_spinkit/flutter_spinkit.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen>
{
  String selectedCurrency = INITIAL_CURRENCY, bitCoinValue = "?";
  bool showLoadingWidget = true;

  DropdownButton<String> getAndroidDropdownPicker()
  {
    return DropdownButton<String>(
      items: CoinData().getDropDownButtonsFromCoins(),
      value: selectedCurrency,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
        getPriceRate();
        print("Selected Value $value");
      },
    );
  }

  CupertinoPicker getIOSCupertinoPicker()
  {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedItemPosition) {
         selectedCurrency = currenciesList[selectedItemPosition];
         getPriceRate();

      },
      backgroundColor: Colors.lightBlue,
      children: CoinData().getCupertinoPickerItemsFromCoins(),
    );
  }

  Widget getCurrencyPicker()
  {
    if(Platform.isAndroid)
      return getAndroidDropdownPicker();
    else if(Platform.isIOS)
      return getIOSCupertinoPicker();
    return null;
  }

  Future<void> getPriceRate() async
  {
    setState(()
    {
      showLoadingWidget = true;
      bitCoinValue = "?";
    });
    PriceRateFetchingTask priceRateFetchingTask = PriceRateFetchingTask();
    String lastPrice = await priceRateFetchingTask.fetchPriceRate(selectedCurrency);
    setState(()
    {
      bitCoinValue = lastPrice;
      showLoadingWidget = false;
    });
    print("Last Price From Price Screen $lastPrice");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPriceRate();
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
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bitCoinValue $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            maintainState: true,
            maintainAnimation: true,
            visible: showLoadingWidget,
            child: Column(
              children: <Widget>[
                SpinKitRing(
                  color: Colors.lightBlueAccent,
                  size: 100.0,
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  "Fetching Crypto Currency Value",
                  style: TextStyle(
                    color: Colors.grey[600]
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getCurrencyPicker(),
          ),
        ],
      ),
    );
  }
}


