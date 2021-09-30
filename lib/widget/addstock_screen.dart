import 'package:flutter/material.dart';
import 'package:jsonproject/controller/portfolio_data_controller.dart';
import 'package:get/get.dart';

class AddStockScreen extends StatefulWidget {
  const AddStockScreen({Key? key}) : super(key: key);

  @override
  _AddStockScreenState createState() => _AddStockScreenState();
}

class _AddStockScreenState extends State<AddStockScreen> {
  DataController controller = Get.find();

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> portfolioData = {
    "stock_symbol": "",
    "stock_amount": "",
    "stock_type": "",
  };

  addStock() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      print("Form is vaid ");

      print('Data for portfolio $portfolioData');
      controller.addNewStock(portfolioData);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Stock App'),
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Stock Symbol',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Stock Symbol Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    portfolioData['stock_symbol'] = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Stock Amount'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Stock Amount Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    portfolioData['stock_amount'] = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'IPO/SEC'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Stock Type Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    portfolioData['stock_type'] = value!;
                  },
                ),
                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: addStock,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
