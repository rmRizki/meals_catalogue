import 'package:flutter/material.dart';
import 'package:meals_catalogue/api/meals_api.dart';
import 'package:meals_catalogue/view/detail.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String category = "Dessert";
  String inputQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool inner) {
          return <Widget>[
            SliverAppBar(
              title: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "$category ...",
                    hintStyle: TextStyle(color: Colors.white70)),
                onChanged: (query) {
                  setState(() {
                    inputQuery = query;
                  });
                },
              ),
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
          ];
        },
        body: searchResult(),
      ),
    );
  }

  Widget searchResult() {
    return FutureBuilder(
        future: MealsApi().loadDataSearch(inputQuery, category),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return Center(child: Text('No result for "$inputQuery"'));
              else
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data.search.length,
                  itemBuilder: (context, index) {
                    var id = snapshot.data.search[index].idSearch;
                    var name = snapshot.data.search[index].nameSearch;
                    var img = snapshot.data.search[index].thumbSearch;
                    return Container(
                      margin: EdgeInsets.all(16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Card(
                          elevation: 8,
                          child: GridTile(
                            child: GestureDetector(
                                child: Hero(
                                  tag: img,
                                  child: Image.network(
                                    img,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            id, img, name, category),
                                      ));
                                }),
                            footer: Container(
                              color: Colors.white70,
                              child: Text(
                                name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
          }
        });
  }
}
