import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jsonproject/json_api_entry.dart';
import 'package:jsonproject/parsing_json.dart';

class TopGainersLosersContainer extends StatefulWidget {
  const TopGainersLosersContainer({Key? key}) : super(key: key);

  @override
  _TopGainersLosersContainerState createState() =>
      _TopGainersLosersContainerState();
}

class _TopGainersLosersContainerState extends State<TopGainersLosersContainer> {
  List<TopGainersLosersData> characterList =
      new List<TopGainersLosersData>.empty(growable: true);

  void getTopGainersLosersApi() async {
    TopGainersLosersApi.getTopGainersLosersData().then((response) {
      if (this.mounted) {
        setState(() {
          Iterable list = json.decode(response.body);
          characterList = list
              .map((model) => TopGainersLosersData.fromJson(model))
              .toList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getTopGainersLosersApi();
  }

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
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFF23292F),
          shape: BoxShape.rectangle,
        ),
        child: Column(
          children: [
            Text("Top Gainers : ",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                itemCount: characterList.length ~/ 2,
                itemBuilder: (context, index) => characterList[index].status ==
                        "Gainer"
                    ? Container(
                        decoration: BoxDecoration(
                          color: (characterList[index].status == 'Gainer')
                              ? Colors.green
                              : Colors.redAccent,
                          border: Border(
                            bottom: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child:
                            ListTile(
                              horizontalTitleGap: 25,
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  "${characterList[index].change}%",
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  characterList[index].symbol,
                                  style: TextStyle(color: Colors.white, fontSize: 19),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "Rs. ${characterList[index].pointChange}",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              ),
                              contentPadding: EdgeInsets.only(left: 50, right: 50),
                        ),
                      )
                    : Container(),
              ),
            ),
            Text("Top Losers : ",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                itemCount: characterList.length,
                itemBuilder: (context, index) => characterList[index].status ==
                        "losers"
                    ? Container(
                        decoration: BoxDecoration(
                          color: (characterList[index].status == 'losers')
                              ? Colors.redAccent
                              : Colors.green,
                          border: Border(
                            bottom: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child: ListTile(
                          horizontalTitleGap: 25,
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              "${characterList[index].change}%",
                              style: TextStyle(color: Colors.white,fontSize: 16),
                            ),
                          ),
                              title: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  characterList[index].symbol,
                                  style: TextStyle(color: Colors.white, fontSize: 19),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  "Rs. ${characterList[index].pointChange}",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              ),
                              contentPadding: EdgeInsets.only(left: 50, right: 50),
                            ),

                      )
                    : Container(),
              ),
            ),
          ],
        ),
      );
    }
  }
}
