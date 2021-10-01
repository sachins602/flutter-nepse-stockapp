
import 'package:flutter/material.dart';
import 'package:jsonproject/widget/child_widget.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int currentIndex = 0;

  Widget childWidget = ChildWidget(
    number: AvailableNumber.First,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[500],
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          _pageController.animateToPage(
            value,
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          );

          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("Buy"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            title: Text("Sell"),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.dashboard),
          //   title: Text("Third"),
          //),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.dashboard),
          //   title: Text("Third"),
          // ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: <Widget>[
          ChildWidget(number: AvailableNumber.First),
          ChildWidget(number: AvailableNumber.Second),
          // ChildWidget(number: AvailableNumber.Third),
          // ChildWidget(number: AvailableNumber.Third)
        ],
      ),
    );
  }
}