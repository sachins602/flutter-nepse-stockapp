import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jsonproject/parsing_json.dart';
import 'package:jsonproject/ui/login_screen.dart';

import 'parsing_json.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jsonproject/json_api_entry.dart';
import 'package:jsonproject/widget/navigation_drawer.dart';
class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {

  late List<NepseSensetiveData> indexList =
  new List<NepseSensetiveData>.empty(growable: true);
  String? stringResponse;
  Future getMarketStatus() async {
    http.Response response;
    response = await http.get(
        Uri.parse('http://10.0.2.2:5000/market_status'));
    if(response.statusCode==200){
      setState(() {
        stringResponse = response.body;
      });
    }

  }

  void getNepsedatafromApi() async {
    NepseSensetiveApi.getNepseSensetiveData().then((response) {
      if (this.mounted) {
        setState(() {
          Iterable list = json.decode(response.body);
          indexList =
              list.map((model) => NepseSensetiveData.fromJson(model)).toList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getNepsedatafromApi();
    getMarketStatus();
  }


  @override
  Widget build(BuildContext context) {
    if(indexList.isEmpty){
      return Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Container(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            backgroundColor: Colors.redAccent,
            valueColor: AlwaysStoppedAnimation(Colors.green),
            strokeWidth: 2,
          ),
        ),
      );
    }
    else {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFF000000),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFF212736),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${indexList[0].index.toUpperCase()} :',
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    '${indexList[0].close}',
                                    style:
                                    TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color: (double.parse(indexList[3].pointChange) <= 0)? Colors.redAccent : Colors.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Point Change :  ${indexList[0].pointChange}',
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30, 0, 0, 0),
                                  child: Text(
                                    '% change :  ${indexList[0].change}',
                                    style:
                                    TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: (stringResponse.toString()=='Market Closed')? Colors.redAccent: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 50,
                      child: Container(

                        alignment: Alignment.center,
                        height: 40,
                        width: 80,
                        child: SingleChildScrollView(child: Text(stringResponse.toString(),style: TextStyle(color: Colors.white,fontSize: 12),)),
                      ),
                      //clipBehavior: Clip.antiAlias,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                  color:Color(0xFF212736),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '${indexList[1].index.toUpperCase()} :',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              ' ${indexList[1].close}',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color:  (double.parse(indexList[3].pointChange) <= 0)? Colors.redAccent : Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Point Change :  ${indexList[1].pointChange}',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                              child: Text(
                                '% change :  ${indexList[1].change}',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFF212736),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '${indexList[2].index.toUpperCase()} :',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                            child: Text(
                              '${indexList[2].close}',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color:  (double.parse(indexList[3].pointChange) <= 0)? Colors.redAccent : Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Point Change : ${indexList[2].pointChange}',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                              child: Text(
                                '% change : ${indexList[2].change}',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFF212736),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '${indexList[3].index.toUpperCase()} :',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                            child: Text(
                              '${indexList[3].close}',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color:  (double.parse(indexList[3].pointChange) <= 0)? Colors.redAccent : Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Point Change : ${indexList[3].pointChange}',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                              child: Text(
                                '% change:  ${indexList[3].change}',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

}

































// import 'dart:convert';
// import 'package:jsonproject/parsing_json.dart';
//
// import 'parsing_json.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:jsonproject/json_api_entry.dart';
// import 'package:jsonproject/parsing_json.dart';
// import 'package:jsonproject/widget/navigation_drawer.dart';
// class HomeContainer extends StatefulWidget {
//   const HomeContainer({Key? key}) : super(key: key);
//
//   @override
//   _HomeContainerState createState() => _HomeContainerState();
// }
//
// class _HomeContainerState extends State<HomeContainer> {
//
//   late List<NepseSensetiveData> indexList =
//   new List<NepseSensetiveData>.empty(growable: true);
//   String? stringResponse;
//   Future getMarketStatus() async {
//     http.Response response;
//     response = await http.get(
//         Uri.parse('http://10.0.2.2:5000/market_status'));
//     if(response.statusCode==200){
//       setState(() {
//         stringResponse = response.body;
//       });
//     }
//
//   }
//
//   void getNepsedatafromApi() async {
//     NepseSensetiveApi.getNepseSensetiveData().then((response) {
//       if (this.mounted) {
//         setState(() {
//           Iterable list = json.decode(response.body);
//           indexList =
//               list.map((model) => NepseSensetiveData.fromJson(model)).toList();
//         });
//       }
//     });
//   }
//
//   colorPicker(){
//     Color myColor;
//     if(double.parse(indexList[3].pointChange) <= 0 ){
//         myColor = Colors.redAccent;
//     }
//     else
//       {
//       myColor = Colors.green;
//     }
//     return myColor;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getNepsedatafromApi();
//     getMarketStatus();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     if(indexList.isEmpty){
//       return Container(
//         height: MediaQuery.of(context).size.height / 1.5,
//         width: MediaQuery.of(context).size.width,
//         alignment: Alignment.center,
//         child: Container(
//           height: 100,
//           width: 100,
//           child: CircularProgressIndicator(
//             backgroundColor: Colors.redAccent,
//             valueColor: AlwaysStoppedAnimation(Colors.green),
//             strokeWidth: 2,
//           ),
//         ),
//       );
//     }
//       else {
//       return Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height * 1,
//         decoration: BoxDecoration(
//           color: Color(0xFF000000),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
//               child: Container(
//                 width: MediaQuery.of(context).size.width-15,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   color: colorPicker(),
//                   borderRadius: BorderRadius.circular(25),
//                     boxShadow: [
//                       BoxShadow(
//                           color: colorPicker().withOpacity(0.7),
//                           blurRadius: 10,
//                           spreadRadius: 7
//                       )
//                     ]
//                 ),
//                 child:  Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding:
//                             EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Text(
//                                   '${indexList[0].index.toUpperCase()} :',
//                                   style: TextStyle(
//                                     fontFamily: 'Lexend Deca',
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w800,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       10, 0, 30, 0),
//                                   child: Text(
//                                     '${indexList[0].close}',
//                                     style:
//                                     TextStyle(
//                                       fontFamily: 'Lexend Deca',
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color: Colors.black12.withOpacity(0.3),
//                                             blurRadius: 10,
//                                             spreadRadius: 3
//                                         )
//                                       ]
//                                   ),
//                                   child: Card(
//                                     color: (stringResponse.toString()=='Market Closed')? Colors.redAccent: Colors.green,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     elevation: 50,
//                                     child: Container(
//                                         alignment: Alignment.center,
//                                         height: 40,
//                                         width: 170,
//                                         child: Text(stringResponse.toString(),style: TextStyle(color: Colors.white,fontSize: 20),)
//                                     ),
//                                     //clipBehavior: Clip.antiAlias,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                             EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Point Change :  ${indexList[0].pointChange}',
//                                   style: TextStyle(
//                                     fontFamily: 'Lexend Deca',
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       30, 0, 0, 0),
//                                   child: Text(
//                                     '% change :  ${indexList[0].change}',
//                                     style:
//                                     TextStyle(
//                                       fontFamily: 'Lexend Deca',
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
//               child: Container(
//                 width: MediaQuery.of(context).size.width-15,
//                 height: 120,
//                 decoration: BoxDecoration(
//                     color: colorPicker(),
//                     borderRadius: BorderRadius.circular(25),
//                     boxShadow: [
//                       BoxShadow(
//                           color: colorPicker().withOpacity(0.7),
//                           blurRadius: 10,
//                           spreadRadius: 7
//                       )
//                     ]
//                 ),
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Text(
//                             '${indexList[1].index.toUpperCase()} :',
//                             style: TextStyle(
//                               fontFamily: 'Lexend Deca',
//                               color: Colors.white,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                             EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                             child: Text(
//                               ' ${indexList[1].close}',
//                               style: TextStyle(
//                                 fontFamily: 'Lexend Deca',
//                                 color:  Colors.white,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Point Change :  ${indexList[1].pointChange}',
//                               style: TextStyle(
//                                 fontFamily: 'Lexend Deca',
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                               EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
//                               child: Text(
//                                 '% change :  ${indexList[1].change}',
//                                 style: TextStyle(
//                                   fontFamily: 'Lexend Deca',
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
//               child: Container(
//                 width: MediaQuery.of(context).size.width-15,
//                 height: 120,
//                 decoration: BoxDecoration(
//                     color: colorPicker(),
//                     borderRadius: BorderRadius.circular(25),
//                     boxShadow: [
//                       BoxShadow(
//                           color: colorPicker().withOpacity(0.7),
//                           blurRadius: 10,
//                           spreadRadius: 7
//                       )
//                     ]
//                 ),
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Text(
//                             '${indexList[2].index.toUpperCase()} :',
//                             style: TextStyle(
//                               fontFamily: 'Lexend Deca',
//                               color: Colors.white,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                             EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
//                             child: Text(
//                               '${indexList[2].close}',
//                               style: TextStyle(
//                                 fontFamily: 'Lexend Deca',
//                                 color:  Colors.white,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Point Change : ${indexList[2].pointChange}',
//                               style: TextStyle(
//                                 fontFamily: 'Lexend Deca',
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                               EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
//                               child: Text(
//                                 '% change : ${indexList[2].change}',
//                                 style: TextStyle(
//                                   fontFamily: 'Lexend Deca',
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
//               child: Container(
//                 width: MediaQuery.of(context).size.width-15,
//                 height: 120,
//                 decoration: BoxDecoration(
//                     color: colorPicker(),
//                     borderRadius: BorderRadius.circular(25),
//                     boxShadow: [
//                       BoxShadow(
//                           color: colorPicker().withOpacity(0.7),
//                           blurRadius: 10,
//                           spreadRadius: 7
//                       )
//                     ]
//                 ),
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Text(
//                             '${indexList[3].index.toUpperCase()} :',
//                             style: TextStyle(
//                               fontFamily: 'Lexend Deca',
//                               color: Colors.white,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                             EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
//                             child: Text(
//                               '${indexList[3].close}',
//                               style: TextStyle(
//                                 fontFamily: 'Lexend Deca',
//                                 color:  Colors.white,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Point Change : ${indexList[3].pointChange}',
//                               style: TextStyle(
//                                 fontFamily: 'Lexend Deca',
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                               EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
//                               child: Text(
//                                 '% change:  ${indexList[3].change}',
//                                 style: TextStyle(
//                                   fontFamily: 'Lexend Deca',
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     }
//   }
// }
