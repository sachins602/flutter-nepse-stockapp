import 'package:flutter/material.dart';


class ChildWidget extends StatelessWidget {
  final AvailableNumber number;

  const ChildWidget({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String file = "";
    if (number == AvailableNumber.First) {
      file = "first";
    } else if (number == AvailableNumber.Second) {
      file = "second";
      // } else {
      //   file = "third";
      // }
    }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                ),
                hintText: "Buy Amount",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                    
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                ),
                hintText: "Buy Price",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              
              keyboardType: TextInputType.number,
            ),
            Text("Share Amount       ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),),
            Text("SEBON Commission   ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),),
            Text("Broker Commission   ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),),
            Text("DP Fee              ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),),
          ],
        ),
      ),
    );
  }
}

enum AvailableNumber { First, Second }