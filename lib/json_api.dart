
import 'dart:convert';


import 'package:jsonproject/main.dart';
import 'package:jsonproject/parsing_json.dart';
import 'package:jsonproject/json_api_entry.dart';
import 'package:jsonproject/search_company_details.dart';

import 'parsing_json.dart';
import 'package:flutter/material.dart';

class CharacterList extends StatefulWidget {
  final int index;


  CharacterList({Key? key, required this.index}) : super(key: key);

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  // TextEditingController? _textEditingController = TextEditingController();


 Iterable<LiveNepseData> characterListOnSearch =new List<LiveNepseData>.empty(growable: true);
  List<LiveNepseData> characterList = new List<LiveNepseData>.empty(growable: true);



  // void getNepsedatafromApi() async {
  //   NepseApi.getNepseData().then((response) {
  //     if(this.mounted) {
  //     setState(() {
  //       Iterable list = json.decode(response.body);
  //       characterList = list.map((model) => Nepsedata.fromJson(model)).toList();
  //     });
  //   }
  //   });
  // }
  void getLiveNepsedatafromApi() async {
    LiveNepseApi.getNepseData().then((response) {
      if(this.mounted) {
        setState(() {
          Iterable list = json.decode(response.body);
          characterList = list.map((model) => LiveNepseData.fromJson(model)).toList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getLiveNepsedatafromApi();

  }



  Widget build(BuildContext context){
    if(characterList.isEmpty){
      return Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Container(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            backgroundColor: Colors.redAccent,
            valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
            strokeWidth: 3,
          ),
        ),
      );
    }else {
      return Container(
        color: Colors.white,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          children: <Widget>[

            Expanded(
              child: ListView.builder(

                itemCount: characterList.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                        color: (characterList[index].status=='negative')? Colors.redAccent : Colors.green,
                        border: Border(
                          bottom: BorderSide(width: 1, color: Colors.white),
                        ),



                      ),

                      child:ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ScaffoldWidgetForSearchCompanyDetailsPage(
                                          index:index )));
                        },
                        title: Text(characterList[index].symbol, style: TextStyle(color: Colors.white),),
                        subtitle: Text("Rs. ${characterList[index].lTP}",style: TextStyle(color: Colors.white),),
                        trailing: (characterList[index].status=='negative'?Icon(
                          Icons.arrow_drop_down, color: Colors.red[200], size: 60,): Icon(
                          Icons.arrow_drop_up, color: Colors.green[200],size: 60,)
                        ),
                        contentPadding: EdgeInsets.only(left:50, right:50),

                      )
                  );

                },),
            ),
          ],
        ),
      );
    }

  }

}

// ListView.builder(
// itemCount: characterList.length,
// itemBuilder: (context, index) {
// return ListTile(
// title: Text(characterList[index].companyName),
// subtitle: Text(characterList[index].closingPrice),
// leading: CircleAvatar(
// backgroundColor: Colors.blueGrey,
// ),
// );
// },),

//
// if (_tasks == null) {
// return CircularProgressIndicator(
// valueColor: AlwaysStoppedAnimation(const Colors.white),
// );
// }