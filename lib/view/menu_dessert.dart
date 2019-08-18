import 'package:flutter/material.dart';
import 'package:meals_catalogue/model/data_dessert.dart';
import 'package:meals_catalogue/view/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DessertScreen extends StatefulWidget {
  @override
  _DessertScreenState createState() => _DessertScreenState();
}

class _DessertScreenState extends State<DessertScreen> {
  List<Dessert> data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (data.length == 0) {
      return Center(child: CircularProgressIndicator());
    } else {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: data.length,
        itemBuilder: (context, index) {
          var id = data[index].idDessert;
          var name = data[index].nameDessert;
          var img = data[index].thumbDessert;
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
                              builder: (context) =>
                                  DetailScreen(id),
                            ));
                      }),
                  footer: Container(
                    color: Colors.white70,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
  }

  loadData() async {
    String dataUrl =
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert";
    http.Response response = await http.get(dataUrl);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        data = (responseJson['meals'] as List)
            .map((p) => Dessert.fromJson(p))
            .toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
}
