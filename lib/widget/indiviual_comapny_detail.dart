
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

  Map individualCompanyData = {};
// var individualCompanyData;
  //
  // List<IndividualCompanyData> individualCompanyData = new List<IndividualCompanyData>.empty(growable: true);

  Future getIndividualCompanyData() async {
    http.Response response;
    response = await http.get(Uri.parse('http://10.0.2.2:5000/company/${widget.suggestions}'));
    if(response.statusCode == 200){
      setState(() {
        individualCompanyData = json.decode(response.body);
      });
    }


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
      getIndividualCompanyData();
      super.initState();


    }



    @override
  Widget build(BuildContext context) {

        return Scaffold(

          body: individualCompanyData == null? Container() :
          Container(
            width: 300,
            height: 400,
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            color: Colors.deepOrange,
            child: Text(individualCompanyData['Sector'].toString()),
          ),
        );
  }
}


// class IndividualCompanyApi {
//   static Future getIndividualCompanyData() {
//     return http.get(Uri.parse("http://10.0.2.2:5000/company/hdl"));
//   }
// }