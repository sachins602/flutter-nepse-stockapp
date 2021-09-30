import 'dart:convert';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';
import 'package:jsonproject/json_api_entry.dart';
import 'package:jsonproject/parsing_json.dart';
import 'package:jsonproject/search_company_details.dart';

class MarketDataContainer extends StatefulWidget {
  const MarketDataContainer({Key? key}) : super(key: key);

  @override
  _MarketDataContainerState createState() => _MarketDataContainerState();
}

class _MarketDataContainerState extends State<MarketDataContainer> {
  Iterable<ClosingPriceData> characterListOnSearch =
  new List<ClosingPriceData>.empty(growable: true);
  List<ClosingPriceData> characterList =
  new List<ClosingPriceData>.empty(growable: true);

  void getClosingPriceApi() async {
    ClosingPriceApi.getClosingPriceData().then((response) {
      if (this.mounted) {
        setState(() {
          Iterable list = json.decode(response.body);
          characterList =
              list.map((model) => ClosingPriceData.fromJson(model)).toList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getClosingPriceApi();
  }


  List<Widget> _buildCells(int  count) {
    return List.generate(
      count,
          (index) => Tooltip(
            message: characterList[index].name,
            child:Container(
                alignment: Alignment.center,
                width: 120.0,
                height: 40.0,
                color: Colors.black,
                margin: EdgeInsets.only(top: 0,left: 0,bottom: 1,right:0),
                child: Text("${characterList[index].symbol}",style:TextStyle(color: Colors.white),),

      ),
          )
    );
  }

  List<Widget> _buildRows(int count) {
    return List.generate(
      count,
          (index) => Row(
            children: [
              Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 40.0,
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 0,left: 0,bottom: 1,right: 0),
                  child: Text("${characterList[index].open}", style:TextStyle(color: Colors.white),)
              ),
              Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 40.0,
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 0,left: 0,bottom: 1,right: 0),
                  child: Text("${characterList[index].high}", style:TextStyle(color: Colors.white),)
              ),
              Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 40.0,
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 0,left: 0,bottom: 1,right: 0),
                  child: Text("${characterList[index].low}", style:TextStyle(color: Colors.white),)
              ),
              Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 40.0,
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 0,left: 0,bottom: 1,right: 0),
                  child: Text("${characterList[index].close}", style:TextStyle(color: Colors.white),)
              ),
              Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 40.0,
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 0,left: 0,bottom: 1,right: 0),
                  child: Text("${characterList[index].volume}", style:TextStyle(color: Colors.white),)
              ),
              Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 40.0,
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 0,left: 0,bottom: 1,right: 0),
                  child: Text("${characterList[index].previousClose}", style:TextStyle(color: Colors.white),)
              ),
              Container(
                  alignment: Alignment.center,
                  width: 120.0,
                  height: 40.0,
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 0,left: 0,bottom: 1,right: 0),
                  child: Text("${characterList[index].difference}", style:TextStyle(color: Colors.white),)
              ),
            ],

      ),);
  }

  @override
  Widget build(BuildContext context) {
    if (characterList.isEmpty) {
      return Container(
        height: MediaQuery
            .of(context)
            .size
            .height / 1.5,
        width: MediaQuery
            .of(context)
            .size
            .width,
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
    } else {
      return Container(
        child: SingleChildScrollView(
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildCells(characterList.length),
              ),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildRows(characterList.length),
                  ),
                ),
              )
            ],
          ),
          )
        );
    }
  }
}

/*Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: characterList.length,
          itemBuilder: (context, index) {
            return Container(

              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                        color: Colors.redAccent,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            characterList[index].name +" (${characterList[index].symbol})",

                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                        )
                      ],
                    ),
                    )
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Text("Close Price: Rs" +
                          characterList[index].close,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                        child: Text("Previous Close : Rs " +
                          characterList[index].previousClose,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      );
    }
  }
}
*/
// ListTile(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// ScaffoldWidgetForSearchCompanyDetailsPage(
// index:index )));
// },
// title: Text(characterList[index].companyName, style: TextStyle(color: Colors.white),),
// subtitle: Text("Rs. ${characterList[index].differenceRs}",style: TextStyle(color: Colors.white),),
// leading: Text(characterList[index].closingPrice, style: TextStyle(color: Colors.white),),
// trailing: Text(characterList[index].previousClosing, style: TextStyle(color: Colors.white),),
// contentPadding: EdgeInsets.only(left:50, right:50),
//
// ),

//
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// ScaffoldWidgetForSearchCompanyDetailsPage(
// index:index )));
// },

// Text(characterList[index].companyName, style: TextStyle(color: Colors.white),),
// subtitle: Text("Rs. ${characterList[index].closingPrice}",style: TextStyle(color: Colors.white),),
