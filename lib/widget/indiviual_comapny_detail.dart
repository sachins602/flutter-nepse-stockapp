
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
          appBar: AppBar(
            backgroundColor: Color(0xFF181D2A),
            title: Text("Company Details"),
          ),

          body: individualCompanyData == null? Container() :
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color(0xFF181D2A),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFF181D2A),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0xFF51576E),
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        alignment: AlignmentDirectional(-0.8, 0),
                        child: Text(
                          individualCompanyData['Company name'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: individualCompanyData['% Change'][0] == '-'? Colors.red: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFF181D2A),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0xFF51576E),
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        alignment: AlignmentDirectional(-0.8, 0),
                        child: Text(
                          '% Change  :  ' + individualCompanyData['% Change'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: individualCompanyData['% Change'][0] == '-'? Colors.red: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFF181D2A),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0xFF51576E),
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        alignment: AlignmentDirectional(-0.8, 0),
                        child: Text(
                          'Sector  :  ' + individualCompanyData['Sector'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFF181D2A),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0xFF51576E),
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        alignment: AlignmentDirectional(-0.8, 0),
                        child: Text(
                          '52 Weeks High - Low  :  ' + individualCompanyData['52 Weeks High - Low'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFF181D2A),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0xFF51576E),
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        alignment: AlignmentDirectional(-0.8, 0),
                        child: Text(
                          'Book Value  :  ' + individualCompanyData['Book Value'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFF181D2A),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0xFF51576E),
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        alignment: AlignmentDirectional(-0.8, 0),
                        child: Text(
                          'Earning Per Share  : ' + individualCompanyData['EPS'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFF181D2A),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0xFF51576E),
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        alignment: AlignmentDirectional(-0.8, 0),
                        child: Text(
                          'Market Price  :  ' + individualCompanyData['Market Price'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: individualCompanyData['% Change'][0] == ''? Colors.red: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFF181D2A),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0xFF51576E),
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        alignment: AlignmentDirectional(-0.8, 0),
                        child: Text(
                          'P/E Ratio  :  ' + individualCompanyData['P/E Ratio'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFF181D2A),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0xFF51576E),
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        alignment: AlignmentDirectional(-0.8, 0),
                        child: Text(
                          'Price By Volume  :  ' + individualCompanyData['PBV'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFF181D2A),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color(0xFF51576E),
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        alignment: AlignmentDirectional(-0.8, 0),
                        child: Text(
                          ' 1 year Yield  :  ' + individualCompanyData['1 Year Yield'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
  }
}


// class IndividualCompanyApi {
//   static Future getIndividualCompanyData() {
//     return http.get(Uri.parse("http://10.0.2.2:5000/company/hdl"));
//   }
// }Text(individualCompanyData['Sector'].toString()),