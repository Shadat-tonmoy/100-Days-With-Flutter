import 'package:flutter/material.dart';

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

const String INITIAL_CURRENCY = "USD";

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData
{


  List<DropdownMenuItem<String> > getDropDownButtonsFromCoins() {
    List<DropdownMenuItem<String> > dropDownMenuItems = [];
    for (String currency in currenciesList) {
      dropDownMenuItems.add(DropdownMenuItem(
        value: currency,
        child: Text(currency),
      ));
    }
    return dropDownMenuItems;
  }

  List<Widget> getCupertinoPickerItemsFromCoins() {
    List<Widget> cupertinoPickerItems = [];
    for (String currency in currenciesList) {
      cupertinoPickerItems.add(Text(currency));
    }
    return cupertinoPickerItems;
  }
}
