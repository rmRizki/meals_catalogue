import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_catalogue/database/db_helper.dart';
import 'package:meals_catalogue/model/data_meals_detail.dart';
import '../detail.dart';

class FavoriteSeafood extends StatefulWidget {
  @override
  _FavoriteSeafoodState createState() => _FavoriteSeafoodState();
}

class _FavoriteSeafoodState extends State<FavoriteSeafood> {
  Future<List<MealsProperty>> listMeals;
  String menuName = "FavoriteSeafood";
  String category = "Seafood";

  @override
  void initState() {
    listMeals = DBHelper.internal().getFavorite(category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: <MealsProperty>[],
        future: listMeals,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<MealsProperty> favoriteMeals = snapshot.data;
                if (favoriteMeals.isEmpty) {
                  return Center(child: Text("No item here"));
                } else {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: favoriteMeals.length,
                    itemBuilder: (context, index) {
                      var id = favoriteMeals[index].idMeal;
                      var name = favoriteMeals[index].nameMeal;
                      var img = favoriteMeals[index].thumbMeal;
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
                                      fontSize: 18),
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
          }
        });
  }
}
