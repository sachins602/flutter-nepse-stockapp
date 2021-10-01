
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonproject/main.dart';
import 'package:jsonproject/parsing_json.dart';
import 'package:jsonproject/search_company_details.dart';
class SearchResultsContainer extends StatefulWidget {
  var suggestions;
  SearchResultsContainer({Key? key, required this.suggestions}) : super(key: key);

  @override
  _SearchResultsContainerState createState() => _SearchResultsContainerState();
}

class _SearchResultsContainerState extends State<SearchResultsContainer> {
  List<IndividualCompanyData> individualCompanyData = <IndividualCompanyData>[];
  // List<IndividualCompanyData> individualCompanyData = new List<IndividualCompanyData>.empty(growable: true);
  //
  // //List<IndividualCompanyData> characterList = new List<IndividualCompanyData>.empty(growable: true);
  //
  Future<Null> getIndividualCompanyData() async {
    // http.Response response;
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/company/${widget.suggestions}'));
     individualCompanyData = IndividualCompanyData.fromJson(jsonDecode(response.body)) as List<IndividualCompanyData>;

  }

    // void getIndividualCofromApi() async {
    //   LiveNepseApi.getNepseData().then((response) {
    //     if(this.mounted) {
    //       setState(() {
    //         Iterable list = json.decode(response.body);
    //         characterList = list.map((model) => LiveNepseData.fromJson(model)).toList();
    //       });
    //     }
    //   });
    // }

    @override
    void initState() {
      super.initState();
      getIndividualCompanyData();

    }



    @override
  Widget build(BuildContext context) {




    return Scaffold(
      body: Container(
                width: 300,
                height: 400,
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                color: Colors.deepOrange,
        child: Text(widget.suggestions),
      ),
    );
  }
}


// class IndividualCompanyApi {
//   static Future getIndividualCompanyData() {
//     return http.get(Uri.parse("http://10.0.2.2:5000/company/hdl"));
//   }
// }