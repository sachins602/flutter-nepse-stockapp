import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jsonproject/controller/portfolio_data_controller.dart';
import 'package:jsonproject/home.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:jsonproject/json_api.dart';
import 'package:jsonproject/marketdata.dart';
import 'package:jsonproject/portfolio.dart';
import 'package:jsonproject/topgainers_losers.dart';
import 'package:jsonproject/ui/calculator_screen.dart';
import 'package:jsonproject/ui/company_extradetails_page.dart';
import 'package:jsonproject/ui/login_screen.dart';
import 'package:jsonproject/widget/indiviual_comapny_detail.dart';
import 'package:jsonproject/widget/navigation_drawer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginPageEntryPoint());
}

var indexClicked = 0;

class LoginPageEntryPoint extends StatefulWidget {
  const LoginPageEntryPoint({Key? key}) : super(key: key);

  @override
  _LoginPageEntryPointState createState() => _LoginPageEntryPointState();
}

class _LoginPageEntryPointState extends State<LoginPageEntryPoint> {
  final firebaseInstance = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: ScaffoldWidgetForHome(),
      //initialRoute: '/firstScreen',
      routes: {
        '/firstScreen': (context) => ScaffoldWidgetForHome(),
        '/secondScreen': (context) => ScaffoldWidgetForPortfolio(),
        '/thirdScreen': (context) => ScaffoldWidgetForSearch(),
        '/fourthScreen': (context) => ScaffoldWidgetForMarketData(),
        '/fifthScreen': (context) => ScaffoldWidgetForTopGainersLosers(),
        '/sixthScreen': (context) => ScaffoldWidgetForIndividualCompanyDetail(),
        '/seventhScreen' : (context) => CalculatorScreen(),

        //'/sixthScreen': (context) => LoginPageEntryPoint(),
      },

      home: LoginScreen(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       //home: ScaffoldWidgetForHome(),
//       initialRoute: '/firstScreen',
//       routes: {
//         '/firstScreen': (context) => ScaffoldWidgetForHome(),
//         '/secondScreen': (context) => ScaffoldWidgetForPortfolio(),
//         '/thirdScreen': (context) => ScaffoldWidgetForSearch(),
//         '/fourthScreen': (context) => ScaffoldWidgetForMarketData(),
//         '/sixthScreen': (context) => LoginPageEntryPoint(),
//       },
//     );
//   }
// }

class ScaffoldWidgetForHome extends StatefulWidget {
  const ScaffoldWidgetForHome({Key? key}) : super(key: key);

  @override
  _ScaffoldWidgetForHomeState createState() => _ScaffoldWidgetForHomeState();
}

class _ScaffoldWidgetForHomeState extends State<ScaffoldWidgetForHome> {
  final DataController controller = Get.put(DataController());
  //static const routeName = '/firstScreen';

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF262626),
        title: Text("Index"),
      ),
      drawer: DrawerWidget(),
      body: HomeContainer(),
      // bottomNavigationBar: BottomAppBar(
      //   child: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: _currentIndex,
      //     backgroundColor: Color(0xFF262626),
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.white.withOpacity(.6),
      //     selectedFontSize: 14,
      //     unselectedFontSize: 14,
      //     onTap: (value) {
      //       // Respond to item press.
      //       setState(() => _currentIndex = value);
      //       switch (_currentIndex) {
      //         case 0:
      //           {
      //             debugPrint("Pressed Home");
      //           }
      //           break;
      //         case 1:
      //           {
      //             Navigator.pop(context);
      //             Navigator.pushNamed(context, '/secondScreen');
      //           }
      //           break;
      //         case 2:
      //           {
      //             Navigator.pop(context);
      //             Navigator.pushNamed(context, '/thirdScreen');
      //           }
      //           break;
      //         case 3:
      //           {
      //             Navigator.pop(context);
      //             Navigator.pushNamed(context, '/fourthScreen');
      //           }
      //           break;
      //       }
      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //         label: 'Home',
      //         icon: Icon(Icons.home),
      //       ),
      //       BottomNavigationBarItem(
      //         label: 'Portfolio',
      //         icon: Icon(Icons.attach_money),
      //       ),
      //       BottomNavigationBarItem(
      //         label: 'Search',
      //         icon: Icon(Icons.search_outlined),
      //       ),
      //       BottomNavigationBarItem(
      //         label: 'Market Data',
      //         icon: Icon(Icons.library_books),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class ScaffoldWidgetForPortfolio extends StatefulWidget {
  const ScaffoldWidgetForPortfolio({Key? key}) : super(key: key);

  @override
  _ScaffoldWidgetForPortfolioState createState() =>
      _ScaffoldWidgetForPortfolioState();
}

class _ScaffoldWidgetForPortfolioState
    extends State<ScaffoldWidgetForPortfolio> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF262626),
        title: Text("Portfolio"),
      ),
      drawer: DrawerWidget(),
      body: PortfolioContainer(),

//       bottomNavigationBar: BottomAppBar(
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _currentIndex,
//           backgroundColor: Color(0xFF262626),
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.white.withOpacity(.6),
//           selectedFontSize: 14,
//           unselectedFontSize: 14,
//           onTap: (value) {
// // Respond to item press.
//             setState(() => _currentIndex = value);
//             switch (_currentIndex) {
//               case 0:
//                 {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, '/firstScreen');
//                 }
//                 break;
//               case 1:
//                 {
//                   debugPrint("Pressed Portfolio");
//                 }
//                 break;
//               case 2:
//                 {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, '/thirdScreen');
//                 }
//                 break;
//               case 3:
//                 {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, '/fourthScreen');
//                 }
//                 break;
//             }
//           },
//           items: [
//             BottomNavigationBarItem(
//               label: 'Home',
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               label: 'Portfolio',
//               icon: Icon(Icons.attach_money),
//             ),
//             BottomNavigationBarItem(
//               label: 'Search',
//               icon: Icon(Icons.search_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'Market Data',
//               icon: Icon(Icons.library_books),
//             ),
//           ],
//         ),
//       ),
    );
  }
}

class ScaffoldWidgetForSearch extends StatefulWidget {
  const ScaffoldWidgetForSearch({Key? key}) : super(key: key);

  @override
  _ScaffoldWidgetForSearchState createState() =>
      _ScaffoldWidgetForSearchState();
}

class _ScaffoldWidgetForSearchState extends State<ScaffoldWidgetForSearch> {
  // static const routeName = '/secondScreen';
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF262626),
        title: Text("Live Market"),
      ),
      drawer: DrawerWidget(),
      body: CharacterList(
        index: _currentIndex,
      ),
//       bottomNavigationBar: BottomAppBar(
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _currentIndex,
//           backgroundColor: Color(0xFF262626),
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.white.withOpacity(.6),
//           selectedFontSize: 14,
//           unselectedFontSize: 14,
//           onTap: (value) {
// // Respond to item press.
//             setState(() => _currentIndex = value);
//             switch (_currentIndex) {
//               case 0:
//                 {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, '/firstScreen');
//                 }
//                 break;
//               case 1:
//                 {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, '/secondScreen');
//                 }
//                 break;
//               case 2:
//                 {
//                   debugPrint("Pressed Search");
//                 }
//                 break;
//               case 3:
//                 {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, '/fourthScreen');
//                 }
//                 break;
//             }
//           },
//           items: [
//             BottomNavigationBarItem(
//               label: 'Home',
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               label: 'Portfolio',
//               icon: Icon(Icons.attach_money),
//             ),
//             BottomNavigationBarItem(
//               label: 'Search',
//               icon: Icon(Icons.search_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'Market Data',
//               icon: Icon(Icons.library_books),
//             ),
//           ],
//         ),
//       ),
    );
  }
}

class ScaffoldWidgetForMarketData extends StatefulWidget {
  const ScaffoldWidgetForMarketData({Key? key}) : super(key: key);

  @override
  _ScaffoldWidgetForMarketDataState createState() =>
      _ScaffoldWidgetForMarketDataState();
}

class _ScaffoldWidgetForMarketDataState
    extends State<ScaffoldWidgetForMarketData> {
  int _currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF262626),
        title: Text("Market Data"),
      ),
      drawer: DrawerWidget(),
      body: MarketDataContainer(),
//       bottomNavigationBar: BottomAppBar(
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _currentIndex,
//           backgroundColor: Color(0xFF262626),
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.white.withOpacity(.6),
//           selectedFontSize: 14,
//           unselectedFontSize: 14,
//           onTap: (value) {
// // Respond to item press.
//             setState(() => _currentIndex = value);
//             switch (_currentIndex) {
//               case 0:
//                 {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, '/firstScreen');
//                 }
//                 break;
//               case 1:
//                 {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, '/secondScreen');
//                 }
//                 break;
//               case 2:
//                 {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, '/thirdScreen');
//                 }
//                 break;
//               case 3:
//                 {
//                   debugPrint("Pressed Marketdata");
//                 }
//                 break;
//             }
//           },
//           items: [
//             BottomNavigationBarItem(
//               label: 'Home',
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               label: 'Portfolio',
//               icon: Icon(Icons.attach_money),
//             ),
//             BottomNavigationBarItem(
//               label: 'Search',
//               icon: Icon(Icons.search_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'Market Data',
//               icon: Icon(Icons.library_books),
//             ),
//           ],
//         ),
//       ),
    );
  }
}

class ScaffoldWidgetForTopGainersLosers extends StatefulWidget {
  const ScaffoldWidgetForTopGainersLosers({Key? key}) : super(key: key);

  @override
  _ScaffoldWidgetForTopGainersLosersState createState() =>
      _ScaffoldWidgetForTopGainersLosersState();
}

class _ScaffoldWidgetForTopGainersLosersState
    extends State<ScaffoldWidgetForTopGainersLosers> {
  // static const routeName = '/secondScreen';
  int _currentIndex = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF262626),
        title: Text("Top Gainers/Losers"),
      ),
      drawer: DrawerWidget(),
      body: TopGainersLosersContainer(),
    );
  }
}

class ScaffoldWidgetForIndividualCompanyDetail extends StatefulWidget {
  const ScaffoldWidgetForIndividualCompanyDetail({
    Key? key,
  }) : super(key: key);
  @override
  _ScaffoldWidgetForIndividualCompanyDetailState createState() =>
      _ScaffoldWidgetForIndividualCompanyDetailState();
}

class _ScaffoldWidgetForIndividualCompanyDetailState
    extends State<ScaffoldWidgetForIndividualCompanyDetail> {
  String selectedPlace = '';
  String url = '';
  @override
  Widget build(BuildContext context) {
    // final response =  await http.get(Uri.parse(url);

    return Scaffold(
      backgroundColor: Color(0xFF101010),
      appBar: AppBar(
        backgroundColor: Color(0xFF262626),
        title: Text("Company Details"),
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          OutlinedButton.icon(
            label: Text('Search'),
            icon: Icon(Icons.search),
            style: OutlinedButton.styleFrom(
                primary: Colors.green, side: BorderSide(color: Colors.blue)),
            onPressed: () async {
              final finalResult = await showSearch(
                  context: context, delegate: NameSearch(names: names));
              setState(() {
                selectedPlace = finalResult!;
              });
            },
          ),
          if (selectedPlace == '')
            Container()
          else
            Container(
              padding: EdgeInsets.only(left: 50, top: 80),
              child: OutlinedButton.icon(

                label: Text(
                  "PRESS HERE FOR DETAILS OF " + selectedPlace,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                icon: Icon(Icons.search),
                style: OutlinedButton.styleFrom(
                    primary: Colors.green,
                    side: BorderSide(color: Colors.blueGrey.shade900)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchResultsContainer(
                                suggestions: selectedPlace)));
                  },

              ),

              // ElevatedButton(
              //   autofocus: true,
              //   child: Container(
              //     color: Color(0xFF162026),
              //     child: Text("PRESS HERE FOR DETAILS OF " + selectedPlace,
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),),
              //   ),
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => SearchResultsContainer(
              //                 suggestions: selectedPlace)));
              //   },
              // ),
            ),

          // Container(
          //       width: 350,
          //       height: 350,
          //       padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          //       color: Colors.deepOrange,
          //       child: Column(
          //         children: [
          //
          //
          //         ],
          //       ),
          //     ),
          // Expanded(
          //   child: ListView.builder(itemBuilder: (context, index) {
          //     return ListTile(
          //       title: Text(names[index]),
          //     );
          //   }),
          // ),
        ],
      ),

      // ListView.builder(
      //   itemCount: names.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       title: Text(
      //         names.elementAt(index),
      //       ),
      //     );
      //   },
      // ),
      //   floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.search),
      //     onPressed: () async {
      //       final result = await showSearch<String>(
      //         context: context,
      //         delegate: NameSearch(names),
      //       );
      //
      //       print(result);
      //     },
      //   ),
    );
  }
}

final List<String> names = [
  'ACLBSL',
  'ADBL',
  'ADBLD83',
  'AHPC',
  'AIL',
  'AKJCL',
  'AKPL',
  'ALBSL',
  'ALICL',
  'API',
  'BARUN',
  'BBC',
  'BFC',
  'BNT',
  'BOKL',
  'BPCL',
  'CBBL',
  'CBL',
  'CBLPO',
  'CCBL',
  'CFCL',
  'CGH',
  'CHCL',
  'CHDC',
  'CHL',
  'CIT',
  'CLBSL',
  'CMF1',
  'CMF2',
  'CORBL',
  'CZBIL',
  'DDBL',
  'DHPL',
  'EBL',
  'EDBL',
  'EIC',
  'EICPO',
  'FMDBL',
  'FOWAD',
  'GBBL',
  'GBIME',
  'GBLBS',
  'GFCL',
  'GHL',
  'GIC',
  'GILB',
  'GIMES1',
  'GLBSL',
  'GLH',
  'GLICL',
  'GMFBS',
  'GMFIL',
  'GRDBL',
  'GUFL',
  'GWFD83',
  'HDHPC',
  'HDL',
  'HGI',
  'HIDCL',
  'HPPL',
  'HURJA',
  'ICFC',
  'ICFCD83',
  'IGI',
  'ILBS',
  'JBBL',
  'JBLB',
  'JFL',
  'JLI',
  'JOSHI',
  'JSLBB',
  'KBL',
  'KEF',
  'KKHC',
  'KLBSL',
  'KMCDB',
  'KPCL',
  'KRBL',
  'KSBBL',
  'LBBL',
  'LBL',
  'LBLD88',
  'LEC',
  'LEMF',
  'LGIL',
  'LICN',
  'LLBS',
  'LUK',
  'MBL',
  'MDB',
  'MEGA',
  'MEGAPO',
  'MEN',
  'MERO',
  'MFIL',
  'MFLD85',
  'MHNL',
  'MKJC',
  'MKLB',
  'MLBBL',
  'MLBL',
  'MLBSL',
  'MMFDB',
  'MNBBL',
  'MPFL',
  'MSLB',
  'NABBC',
  'NABIL',
  'NBB',
  'NBF2',
  'NBL',
  'NCCB',
  'NEF',
  'NFS',
  'NGPL',
  'NHDL',
  'NHPC',
  'NIBLPF',
  'NIBSF1',
  'NIBSF2',
  'NICA',
  'NICAD8283',
  'NICBF',
  'NICGF',
  'NICL',
  'NICLBSL',
  'NICSF',
  'NIFRA',
  'NIL',
  'NLBBL',
  'NLG',
  'NLIC',
  'NLICL',
  'NMB',
  'NMB50',
  'NMBHF1',
  'NMBMF',
  'NMFBS',
  'NRIC',
  'NRN',
  'NSLB',
  'NTC',
  'NUBL',
  'OHL',
  'PBD85',
  'PBLD84',
  'PCBL',
  'PFL',
  'PIC',
  'PICL',
  'PLI',
  'PLIC',
  'PMHPL',
  'PPCL',
  'PRIN',
  'PROFL',
  'PRVU',
  'PRVUPO',
  'PSF',
  'RADHI',
  'RBCL',
  'RBCLPO',
  'RHPC',
  'RHPL',
  'RLFL',
  'RLI',
  'RMDC',
  'RMF1',
  'RRHP',
  'RSDC',
  'RURU',
  'SABSL',
  'SADBL',
  'SAEF',
  'SAND2085',
  'SANIMA',
  'SAPDBL',
  'SBCF',
  'SBD87',
  'SBI',
  'SBIBD86',
  'SBL',
  'SCB',
  'SDLBSL',
  'SEF',
  'SFCL',
  'SFMF',
  'SGI',
  'SHEL',
  'SHINE',
  'SHIVM',
  'SHL',
  'SHPC',
  'SIC',
  'SICL',
  'SIFC',
  'SIGS2',
  'SIL',
  'SINDU',
  'SJCL',
  'SKBBL',
  'SLBBL',
  'SLBBLP',
  'SLBSL',
  'SLCF',
  'SLI',
  'SLICL',
  'SMATA',
  'SMB',
  'SMFBS',
  'SMFDB',
  'SPDL',
  'SRBL',
  'SRBLD83',
  'SRD80',
  'SSHL',
  'STC',
  'SWBBL',
  'TRH',
  'UIC',
  'ULI',
  'UMHL',
  'UMRH',
  'UNHPL',
  'UNL',
  'UPCL',
  'UPPER',
  'USLB',
  'VLBS',
];

// class ScaffoldWidgetForSearchCompanyDetailsPage extends StatefulWidget {
//   final int index;
//   const ScaffoldWidgetForSearchCompanyDetailsPage({Key? key, required this.index}) : super(key: key);
//
//   @override
//   _ScaffoldWidgetForSearchCompanyDetailsPageState createState() =>
//       _ScaffoldWidgetForSearchCompanyDetailsPageState(index);
// }
//
// class _ScaffoldWidgetForSearchCompanyDetailsPageState
//     extends State<ScaffoldWidgetForSearchCompanyDetailsPage> {
//   final int value;
//   _ScaffoldWidgetForSearchCompanyDetailsPageState(this.value);
//   int _currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF262626),
//         title: Text("Stock App"),
//       ),
//       body: DetailPageOfSearch(_currentIndex),
//       bottomNavigationBar: BottomAppBar(
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _currentIndex,
//           backgroundColor: Color(0xFF262626),
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.white.withOpacity(.6),
//           selectedFontSize: 14,
//           unselectedFontSize: 14,
//           onTap: (value) {
// // Respond to item press.
//             setState(() => _currentIndex = value);
//             switch (_currentIndex) {
//               case 0:
//                 {
//                   debugPrint("Pressed Home");
//                 }
//                 break;
//               case 1:
//                 {
//                   debugPrint("Pressed Portfolio");
//                 }
//                 break;
//               case 2:
//                 {
//                   debugPrint("Search");
//                 }
//                 break;
//               case 3:
//                 {
//                   debugPrint("Pressed Marketdata");
//                 }
//                 break;
//             }
//           },
//           items: [
//             BottomNavigationBarItem(
//               label: 'Home',
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               label: 'Portfolio',
//               icon: Icon(Icons.attach_money),
//             ),
//             BottomNavigationBarItem(
//               label: 'Search',
//               icon: Icon(Icons.search_outlined),
//             ),
//             BottomNavigationBarItem(
//               label: 'Market Data',
//               icon: Icon(Icons.library_books),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Scaffold(
// appBar: AppBar(
// backgroundColor: Color(0xFF262626),
// title: Text("Stock App"),
// ),
// body: CharacterList(),
// bottomNavigationBar: BottomAppBar(
// child: BottomNavigationBar(
// type: BottomNavigationBarType.fixed,
// currentIndex: _currentIndex,
// backgroundColor: Color(0xFF262626),
// selectedItemColor: Colors.white,
// unselectedItemColor: Colors.white.withOpacity(.6),
// selectedFontSize: 14,
// unselectedFontSize: 14,
// onTap: (value) {
// // Respond to item press.
// setState(() => _currentIndex = value);
// switch(_currentIndex){
// case 0: {
// debugPrint("Pressed Home");
// }
// break;
// case 1: {
// debugPrint("Pressed Portfolio");
// }
// break;
// case 2: {
// debugPrint("Search");
// }
// break;
// case 3: {
// debugPrint("Pressed Marketdata");
// }
// break;
//
//
// }
//
// },
// items: [
// BottomNavigationBarItem(
// label: 'Home',
// icon: Icon(Icons.home),
// ),
// BottomNavigationBarItem(
// label: 'Portfolio',
// icon: Icon(Icons.attach_money),
// ),
// BottomNavigationBarItem(
// label: 'Search',
// icon: Icon(Icons.search_outlined),
// ),
// BottomNavigationBarItem(
// label: 'Market Data',
// icon: Icon(Icons.library_books),
// ),
// ],
// ),
// ),
// ),
