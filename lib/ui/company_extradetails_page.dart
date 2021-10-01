import 'package:flutter/material.dart';

class NameSearch extends SearchDelegate<String> {
  final List<String> names;

  NameSearch({required this.names});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
         close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> allStocks = names.where((name) {
      return name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: allStocks.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            allStocks.elementAt(index),
          ),
          onTap: () {

            names.where((stockSymbol) => stockSymbol.toLowerCase().contains(query.toLowerCase()));


            close(context, query);
            // result = suggestions.elementAt(index);
            // close(context, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> stockSuggestions = names.where((name) {
      return name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: stockSuggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            stockSuggestions.elementAt(index),
          ),
          onTap: () {
           // debugPrint(query);
            query = stockSuggestions.elementAt(index);
            close(context, query);
            // result = suggestions.elementAt(index);
            // close(context, result);
          },
        );
      },
    );
  }
}
// late List<IndividualCompanyData> characterList = new List<IndividualCompanyData>.empty(growable: true);
//
// void getIndividualCompanyApi() async {
//   IndividualCompanyApi.getIndividualCompanyData().then((response) {
//     if(this.mounted) {
//       setState(() {
//         Iterable list = json.decode(response.body);
//         characterList = list.map((model) => IndividualCompanyData.fromJson(model)).toList();
//       });
//     }
//   });
// }
