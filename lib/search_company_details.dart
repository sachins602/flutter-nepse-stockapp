import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jsonproject/json_api_entry.dart';
import 'package:jsonproject/parsing_json.dart';
import 'package:jsonproject/json_api.dart';

class ScaffoldWidgetForSearchCompanyDetailsPage extends StatefulWidget {
  final int index;
  const ScaffoldWidgetForSearchCompanyDetailsPage(
      {Key? key, required this.index})
      : super(key: key);

  @override
  _ScaffoldWidgetForSearchCompanyDetailsPageState createState() =>
      _ScaffoldWidgetForSearchCompanyDetailsPageState(index);
}

class _ScaffoldWidgetForSearchCompanyDetailsPageState
    extends State<ScaffoldWidgetForSearchCompanyDetailsPage> {
  final int index;

  _ScaffoldWidgetForSearchCompanyDetailsPageState(this.index);

  late List<LiveNepseData> characterList =
  new List<LiveNepseData>.empty(growable: true);

  void getNepsedatafromApi() async {
    LiveNepseApi.getNepseData().then((response) {
      if (this.mounted) {
        setState(() {
          Iterable list = json.decode(response.body);
          characterList =
              list.map((model) => LiveNepseData.fromJson(model)).toList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getNepsedatafromApi();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (characterList.isEmpty) {
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
    else{
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Live Market",style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.black87
          ),
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height / 1.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Symbol: ${characterList[index].symbol}", style: TextStyle(color: Colors.white, fontSize: 20),),
                Text("Closing Price: Rs.  ${characterList[index].lTP} ",style: TextStyle(color: Colors.white, fontSize: 20),),
                Text("Today's Volume: ${characterList[index].qty}" ,style: TextStyle(color: Colors.white, fontSize: 20),),
                Text("Day High: Rs. ${characterList[index].high}",style: TextStyle(color: Colors.white, fontSize: 20),),
                Text("Day Low: Rs.  ${characterList[index].low}",style: TextStyle(color: Colors.white, fontSize: 20),),
                Text("Today Gain/Loss: Rs. ${characterList[index].change}",style: TextStyle(color: (characterList[index].status)=='negative'? Colors.red: Colors.green, fontSize: 20),),
              ],
            ),
          ),
        ),
        /* bottomNavigationBar: BottomAppBar(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            backgroundColor: Color(0xFF262626),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(.6),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: (aValue) {
// Respond to item press.
              setState(() => _currentIndex = aValue);
              switch (_currentIndex) {
                case 0:
                  {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/firstScreen');
                  }
                  break;
                case 1:
                  {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/secondScreen');
                  }
                  break;
                case 2:
                  {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/thirdScreen');
                  }
                  break;
                case 3:
                  {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/fourthScreen');
                  }
                  break;
              }
            },/*
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Portfolio',
                icon: Icon(Icons.attach_money),
              ),
              BottomNavigationBarItem(
                label: 'Live Market',
                icon: Icon(Icons.search_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Market Data',
                icon: Icon(Icons.library_books),
              ),
            ],*/
          ),*/
      );

    }
  }
}

//
// class DetailPageOfSearch extends StatefulWidget {
//   final int index;
//
//   const DetailPageOfSearch(int index, {Key? key, required this.index}) : super(key: key);
//
//
//   @override
//   _DetailPageOfSearchState createState() => _DetailPageOfSearchState();
// }
//
// class _DetailPageOfSearchState extends State<DetailPageOfSearch> {
//
//
//
//
//
//   late List<Nepsedata> characterList = new List<Nepsedata>.empty(growable: true);
//
//   void getNepsedatafromApi() async {
//     NepseApi.getNepseData().then((response) {
//       if(this.mounted) {
//         setState(() {
//           Iterable list = json.decode(response.body);
//           characterList = list.map((model) => Nepsedata.fromJson(model)).toList();
//         });
//       }
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getNepsedatafromApi();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xFF8286BF),
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height / 1.7,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Text(characterList[index].companyName),
//         Text(characterList[index].closingPrice),
//             Text("${index}"),
//
//           ],
//         ),
//
//       ),
//     );
//   }
// }
//