import 'package:flutter/material.dart';
import 'package:meals_catalogue/helper/key_name.dart';
import 'package:meals_catalogue/view/favorite/favorite_dessert.dart';
import 'package:meals_catalogue/view/favorite/favorite_seafood.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool inner) {
            return <Widget>[
              SliverAppBar(
                centerTitle: true,
                title: TabBar(
                  tabs: <Widget>[
                    Tab(
                      key: Key(FAVORITE_DESSERT),
                      text: "Dessert",
                    ),
                    Tab(
                      key: Key(FAVORITE_SEAFOOD),
                      text: "Seafood",
                    )
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              FavoriteDessert(),
              FavoriteSeafood(),
            ],
          ),
        ),
      ),
    );
  }
}
