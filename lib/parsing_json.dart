
//import 'dart:async';
//import 'package:http/http.dart' as http;


//
// class Nepsedata {
//   late String amount;
//   late String sN;
//   late String closingPrice;
//   late String companyName;
//   late String differenceRs;
//   late String maxPrice;
//   late String minPrice;
//   late String noOfTransaction;
//   late String previousClosing;
//   late String tradedShares;
//
//   Nepsedata(
//       {required this.amount,
//         required this.sN,
//         required this.closingPrice,
//         required this.companyName,
//         required this.differenceRs,
//         required this.maxPrice,
//         required this.minPrice,
//         required this.noOfTransaction,
//         required this.previousClosing,
//         required this.tradedShares});
//
//   Nepsedata.fromJson(Map<String, dynamic> json) {
//     amount = json['Amount'].toString();
//     sN = json['S.N.'].toString();
//     closingPrice = json['closing_price'].toString();
//     companyName = json['company_name'].toString();
//     differenceRs = json['difference_rs'].toString();
//     maxPrice = json['max_price'].toString();
//     minPrice = json['min_price'].toString();
//     noOfTransaction = json['no_of_transaction'].toString();
//     previousClosing = json['previous_closing'].toString();
//     tradedShares = json['traded_shares'].toString();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Amount'] = this.amount;
//     data['S.N.'] = this.sN;
//     data['closing_price'] = this.closingPrice;
//     data['company_name'] = this.companyName;
//     data['difference_rs'] = this.differenceRs;
//     data['max_price'] = this.maxPrice;
//     data['min_price'] = this.minPrice;
//     data['no_of_transaction'] = this.noOfTransaction;
//     data['previous_closing'] = this.previousClosing;
//     data['traded_shares'] = this.tradedShares;
//     return data;
//   }
// }
//

class LiveNepseData {
  late String symbol;
  late String lTP;
  late String change;
  late String high;
  late String low;
  late String open;
  late String qty;
  late String status;

  LiveNepseData({required this.symbol,
    required this.lTP,
    required this.change,
    required this.high,
    required this.low,
    required this.open,
    required this.qty,
    required this.status,
  });

  LiveNepseData.fromJson(Map<String, dynamic> json) {
    symbol = json['Symbol'].toString();
    lTP = json['LTP'].toString();
    change = json['% Change'].toString();
    high = json['High'].toString();
    low = json['Low'].toString();
    open = json['Open'].toString();
    qty = json['Qty.'].toString();
    status = json['Status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Symbol'] = this.symbol;
    data['LTP'] = this.lTP;
    data['% Change'] = this.change;
    data['High'] = this.high;
    data['Low'] = this.low;
    data['Open'] = this.open;
    data['Qty.'] = this.qty;
    data['Status'] = this.status;
    return data;
  }
}
//
// class NepseSensetiveData {
//   late String nepseOrsenIndex;
//   late String percentChange;
//   late String pointChange;
//   late String title;
//
//   NepseSensetiveData(
//       {
//         required this.nepseOrsenIndex,
//         required this.percentChange,
//         required this.pointChange,
//         required this.title,
//       });
//
//   NepseSensetiveData.fromJson(Map<String, dynamic> json) {
//     nepseOrsenIndex = json['current_index'].toString();
//     percentChange = json['percent_change'].toString();
//     pointChange = json['point_change'].toString();
//     title = json['title'].toString();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> nepseData = new Map<String, dynamic>();
//     nepseData['current_index'] = this.nepseOrsenIndex;
//     nepseData['percent_change'] = this.percentChange;
//     nepseData['point_change'] = this.pointChange;
//     nepseData['title'] = this.title;
//     return nepseData;
//   }
// }
class NepseSensetiveData {
  late String index;
  late String close;
  late String pointChange;
  late String change;

  NepseSensetiveData({required this.index, required this.close, required this.pointChange, required this.change});

  NepseSensetiveData.fromJson(Map<String, dynamic> json) {
    index = json['index'].toString();
    close = json['close'].toString();
    pointChange = json['point change'].toString();
    change = json['% change'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> nepseData = new Map<String, dynamic>();
    nepseData['index'] = this.index;
    nepseData['close'] = this.close;
    nepseData['point change'] = this.pointChange;
    nepseData['% change'] = this.change;
    return nepseData;
  }
}
// class ClosingPriceDataa {
//  late String companyName;
//  late String noOfTransaction;
//  late String maxPrice;
//  late String minPrice;
//  late String closingPrice;
//  late String tradedShares;
//  late String amount;
//  late String previousClosing;
//  late String differenceRs;
//
//   ClosingPriceDataa(
//       {required this.companyName,
//         required this.noOfTransaction,
//         required this.maxPrice,
//         required this.minPrice,
//         required this.closingPrice,
//         required this.tradedShares,
//         required this.amount,
//         required this.previousClosing,
//         required this.differenceRs});
//
//   ClosingPriceDataa.fromJson(Map<String, dynamic> json) {
//     companyName = json['Company Name'].toString();
//     noOfTransaction = json['No. Of Transaction'].toString();
//     maxPrice = json['Max Price'].toString();
//     minPrice = json['Min Price'].toString();
//     closingPrice = json['Closing Price'].toString();
//     tradedShares = json['Traded Shares'].toString();
//     amount = json['Amount'].toString();
//     previousClosing = json['Previous Closing'].toString();
//     differenceRs = json['Difference Rs.'].toString();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> closingDataa = new Map<String, dynamic>();
//     closingDataa['Company Name'] = this.companyName;
//     closingDataa['No. Of Transaction'] = this.noOfTransaction;
//     closingDataa['Max Price'] = this.maxPrice;
//     closingDataa['Min Price'] = this.minPrice;
//     closingDataa['Closing Price'] = this.closingPrice;
//     closingDataa['Traded Shares'] = this.tradedShares;
//     closingDataa['Amount'] = this.amount;
//     closingDataa['Previous Closing'] = this.previousClosing;
//     closingDataa['Difference Rs.'] = this.differenceRs;
//     return closingDataa;
//   }
// }
class ClosingPriceData {
 late String name;
 late String symbol;
 late String open;
 late String high;
 late String low;
 late String close;
 late String volume;
 late String previousClose;
 late String difference;

  ClosingPriceData(
      {required this.name,
        required this.symbol,
        required this.open,
        required this.high,
        required this.low,
        required this.close,
        required this.volume,
        required this.previousClose,
        required this.difference});

  ClosingPriceData.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    symbol = json['symbol'].toString();
    open = json['open'].toString();
    high = json['high'].toString();
    low = json['low'].toString();
    close = json['close'].toString();
    volume = json['volume'].toString();
    previousClose = json['previous close'].toString();
    difference = json['% difference'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> closingData = new Map<String, dynamic>();
    closingData['name'] = this.name;
    closingData['symbol'] = this.symbol;
    closingData['open'] = this.open;
    closingData['high'] = this.high;
    closingData['low'] = this.low;
    closingData['close'] = this.close;
    closingData['volume'] = this.volume;
    closingData['previous close'] = this.previousClose;
    closingData['% difference'] = this.difference;
    return closingData;
  }
}
class IndividualCompanyData {
  late String companyName;
  late String sector;
  late String sharesOutstanding;
  late String marketPrice;
  late String change;
  late String lastTradedOn;
  late String s52WeeksHighLow;
  late String s180DayAverage;
  late String s120DayAverage;
  late String s1YearYield;
  late String ePS;
  late String pERatio;
  late String bookValue;
  late String pBV;

  IndividualCompanyData(
      {required this.companyName,
        required this.sector,
        required this.sharesOutstanding,
        required this.marketPrice,
        required this.change,
        required this.lastTradedOn,
        required this.s52WeeksHighLow,
        required this.s180DayAverage,
        required this.s120DayAverage,
        required this.s1YearYield,
        required this.ePS,
        required this.pERatio,
        required this.bookValue,
        required this.pBV});

  IndividualCompanyData.fromJson(Map<String, dynamic> json) {
    companyName = json['Company name'];
    sector = json['Sector'];
    sharesOutstanding = json['Shares Outstanding'];
    marketPrice = json['Market Price'];
    change = json['% Change'];
    lastTradedOn = json['Last Traded On'];
    s52WeeksHighLow = json['52 Weeks High - Low'];
    s180DayAverage = json['180 Day Average'];
    s120DayAverage = json['120 Day Average'];
    s1YearYield = json['1 Year Yield'];
    ePS = json['EPS'];
    pERatio = json['P/E Ratio'];
    bookValue = json['Book Value'];
    pBV = json['PBV'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> individualCompanyData = new Map<String, dynamic>();
    individualCompanyData['Company name'] = this.companyName;
    individualCompanyData['Sector'] = this.sector;
    individualCompanyData['Shares Outstanding'] = this.sharesOutstanding;
    individualCompanyData['Market Price'] = this.marketPrice;
    individualCompanyData['% Change'] = this.change;
    individualCompanyData['Last Traded On'] = this.lastTradedOn;
    individualCompanyData['52 Weeks High - Low'] = this.s52WeeksHighLow;
    individualCompanyData['180 Day Average'] = this.s180DayAverage;
    individualCompanyData['120 Day Average'] = this.s120DayAverage;
    individualCompanyData['1 Year Yield'] = this.s1YearYield;
    individualCompanyData['EPS'] = this.ePS;
    individualCompanyData['P/E Ratio'] = this.pERatio;
    individualCompanyData['Book Value'] = this.bookValue;
    individualCompanyData['PBV'] = this.pBV;
    return individualCompanyData;
  }
}
class TopGainersLosersData {
  late String symbol;
  late String lTP;
  late String pointChange;
  late String change;
  late String status;

  TopGainersLosersData(
      {required this.symbol, required this.lTP, required this.pointChange, required this.change, required this.status});

  TopGainersLosersData.fromJson(Map<String, dynamic> json) {
    symbol = json['Symbol'];
    lTP = json['LTP'];
    pointChange = json['Point Change'];
    change = json['% Change'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> topGainersLosersData = new Map<String, dynamic>();
    topGainersLosersData['Symbol'] = this.symbol;
    topGainersLosersData['LTP'] = this.lTP;
    topGainersLosersData['Point Change'] = this.pointChange;
    topGainersLosersData['% Change'] = this.change;
    topGainersLosersData['status'] = this.status;
    return topGainersLosersData;
  }
}