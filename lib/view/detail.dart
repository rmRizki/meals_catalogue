import 'package:async/async.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_catalogue/api/meals_api.dart';
import 'package:meals_catalogue/database/db_helper.dart';
import 'package:meals_catalogue/model/data_meals_detail.dart';
import 'package:toast/toast.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final String img;
  final String name;
  final String category;

  DetailScreen(this.id, this.img, this.name, this.category);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final memoizer = AsyncMemoizer();
  bool isFavorite = false;

  @override
  void initState() {
    DBHelper.internal().checkIsFavorite(widget.id).then((boolValue) {
      setState(() {
        isFavorite = boolValue;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: favoriteButton(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool inner) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 270,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.img,
                  child: CachedNetworkImage(
                      imageUrl: widget.img, fit: BoxFit.fill),
                ),
              ),
            )
          ];
        },
        body: detailDesc(),
      ),
    );
  }

  Widget detailDesc() {
    return FutureBuilder(
      future: this.memoizer.runOnce(() async {
        return MealsApi().loadDataDetail(widget.id);
      }),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              var name = widget.name;
              var desc = snapshot.data.meals[0].descMeal;
              return ListView(
                children: <Widget>[
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
                                  child: Text(name,
                                      style: TextStyle(fontSize: 32))),
                            ),
                            Text(desc, textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
        }
      },
    );
  }

  favoriteButton() {
    if (isFavorite) {
      return FloatingActionButton(
        child: Icon(
          Icons.favorite,
        ),
        onPressed: () {
          DBHelper.internal().deleteFavorite(widget.id).then((resValue) {
            if (resValue > 0) {
              setState(() => isFavorite = false);
            }
          });
          Toast.show("Removed from Favorite", context);
        },
      );
    } else {
      return FloatingActionButton(
        child: Icon(
          Icons.favorite_border,
        ),
        onPressed: () {
          MealsProperty data = MealsProperty(
              widget.id, widget.name, widget.img, widget.category, null);
          DBHelper.internal().addFavorite(data).then((resValue) {
            if (resValue > 0) {
              setState(() => isFavorite = true);
            }
          });
          Toast.show("Added to Favorite", context);
        },
      );
    }
  }
}
