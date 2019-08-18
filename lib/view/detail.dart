import 'package:flutter/material.dart';
import 'package:meals_catalogue/model/detail_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  final String id;

  DetailScreen(this.id);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Detail> data = [];

  @override
  void initState() {
    super.initState();
    loadData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getDetailBody());
  }

  getDetailBody() {
    if (data.length == 0) {
      return Center(child: CircularProgressIndicator());
    } else {
      var name = data[0].nameDetail;
      var img = data[0].thumbDetail;
      var desc = data[0].descDetail;
      return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: img,
                child: Image.network(img, fit: BoxFit.fill),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.all(8),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Center(
                                child:
                                    Text(name, style: TextStyle(fontSize: 32))),
                          ),
                          Text(desc, textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }
  }

  loadData(String id) async {
    String dataUrl =
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + id;
    http.Response response = await http.get(dataUrl);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        data = (responseJson['meals'] as List)
            .map((p) => Detail.fromJson(p))
            .toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
}
