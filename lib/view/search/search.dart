import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String category = "Dessert";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: <Widget>[
          RaisedButton(
            child: Text('Dessert'),
            onPressed: () {
              setState(() {
                category = "Dessert";
              });
            },
            textColor: Colors.white,
            color: Colors.blue,
            elevation: 8,
          ),
          RaisedButton(
            child: Text('Seafood'),
            onPressed: () {
              setState(() {
                category = "Seafood";
              });
            },
            textColor: Colors.white,
            color: Colors.blue,
            elevation: 8,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search $category ...",
              ),
              onSubmitted: (query){
                
              },
            ),
          )
        ],
      ),
    );
  }
}
