import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_catalogue/api/meals_api.dart';
import 'package:meals_catalogue/helper/key_name.dart';
import 'package:meals_catalogue/view/detail.dart';

class DessertScreen extends StatefulWidget {
  @override
  _DessertScreenState createState() => _DessertScreenState();
}

class _DessertScreenState extends State<DessertScreen> {
  Future future = MealsApi().loadDataDessert();
  String menuName = "DessertScreen";
  String category = "Dessert";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        key: Key(FUTURE_GRID_DESSERT),
        future: future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return GridView.builder(
                  key: Key(GRID_DESSERT),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data.dessert.length,
                  itemBuilder: (context, index) {
                    var id = snapshot.data.dessert[index].idDessert;
                    var name = snapshot.data.dessert[index].nameDessert;
                    var img = snapshot.data.dessert[index].thumbDessert;
                    return Container(
                      margin: EdgeInsets.all(16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Card(
                          elevation: 8,
                          child: GridTile(
                            child: GestureDetector(
                                child: Hero(
                                    tag: "$img$index$menuName",
                                    child: CachedNetworkImage(
                                      imageUrl: img,
                                      fit: BoxFit.cover,
                                    )),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            id,
                                            img,
                                            name,
                                            category,
                                            menuName,
                                            index),
                                      ));
                                }),
                            footer: Container(
                              color: Colors.white70,
                              child: Text(
                                name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black),
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
