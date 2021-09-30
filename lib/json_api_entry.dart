import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:jsonproject/ui/company_extradetails_page.dart';
//import 'package:http/http.dart';
//import 'package:http_parser/http_parser.dart';

class NepseSensetiveApi {
  static Future getNepseSensetiveData() {
    return http.get(Uri.parse("http://10.0.2.2:5000/index"));
  }
}

// class NepseApi {
//   static Future getNepseData() {
//     return http.get(Uri.parse("http://apinepse.herokuapp.com/"));
//   }
// }
class LiveNepseApi {
  static Future getNepseData() {
    return http.get(Uri.parse("http://10.0.2.2:5000/live_data"));
  }
}

class ClosingPriceApi {
  static Future getClosingPriceData() {
    return http.get(Uri.parse("http://10.0.2.2:5000/today_price"));
  }
}

// class IndividualCompanyApi {
//   static Future getIndividualCompanyData() {
//     return http.get(Uri.parse("http://10.0.2.2:5000/company/hdl"));
//   }
// }
class TopGainersLosersApi {
  static Future getTopGainersLosersData() {
    return http.get(Uri.parse("http://10.0.2.2:5000/loser_gainer"));
  }
}
// final String baseUrl = "http://10.0.2.2:5000";
// class LiveNepseApi {
//   static Future getNepseData() async{
//     final Dio dio = new Dio();
//     var response = await dio.get("$baseUrl/live_data/");
//     return response;
//   }
// }

// class LiveNepseApi {
//   final Dio dio = new Dio();
//     var response = await dio.get("$baseUrl/live_data");
//
// }
