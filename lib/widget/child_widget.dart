import 'package:flutter/material.dart';

class ChildWidget extends StatefulWidget {
  final AvailableNumber number;

  const ChildWidget({Key? key, required this.number}) : super(key: key);

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  // double?
  var companyAmount;
  var sebonPrice;
  var brokerPrice;
  var dpPrice;
  var totalPrice;
  var costPerSharePrice;
  var capitalGainStPrice;
  var profitLossPrice;
  final buyAmountController = new TextEditingController();
  final buyPriceController = new TextEditingController();
  final basePriceController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    String file = "";
    if (widget.number == AvailableNumber.First) {
      file = "first";
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: buyAmountController,
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
                controller: buyPriceController,
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
              ElevatedButton(
                onPressed: () {
                  calculateBuy();
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Column(
                children: [
                  if(companyAmount != null && sebonPrice != null && brokerPrice != null && totalPrice != null)
                    Column(
                      children: [
                        Text(
                          "Share Amount            Rs" + companyAmount,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "SEBON Commission         Rs" + sebonPrice.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Broker Commission         Rs" + brokerPrice.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "DP Fee                     Rs. -25",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Total Amount               Rs" + totalPrice.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                      ],
                    ),



                ],
              ),
            ],
          ),
        ),
      );
    } else if (widget.number == AvailableNumber.Second) {
      file = "second";
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: basePriceController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  ),
                  hintText: "Purchased/Base Price",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: buyAmountController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  ),
                  hintText: "Selling Price",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: buyPriceController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  ),
                  hintText: "No of Shares",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () {
                  calculateBuy();
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Column(
                children: [
                  if(companyAmount != null && sebonPrice != null && brokerPrice != null && totalPrice != null)
                    Column(
                      children: [
                        Text(
                          "Share Amount            Rs" + companyAmount,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "SEBON Commission         Rs" + sebonPrice.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Broker Commission         Rs" + brokerPrice.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "DP Fee                     Rs. -25",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Total Amount               Rs" + totalPrice.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                      ],
                    ),



                ],
              ),
            ],
          ),
        ),
      );
    }



    return Container();
  }

  void calculateBuy() {
    final shareAmount = (double.parse(buyAmountController.text) *
            double.parse(buyPriceController.text))
        .toStringAsFixed(2);
    final sebonCommission = (double.parse(shareAmount) *
        0.01)
        .toStringAsFixed(2);
    final brokerCommission = (double.parse(shareAmount) *
        0.37)
        .toStringAsFixed(2);
    final totalAmount = (double.parse(shareAmount) + double.parse(sebonCommission) + double.parse(brokerCommission) + 25
    ).toStringAsFixed(2);
    setState(() {
      companyAmount = '\.    $shareAmount';
      sebonPrice = '\.    $sebonCommission';
      brokerPrice = '\.   $brokerCommission';
      totalPrice = '\.    $totalAmount';

    });
  }
}

enum AvailableNumber { First, Second }
