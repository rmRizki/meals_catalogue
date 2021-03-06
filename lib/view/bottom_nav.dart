import 'package:flutter/material.dart';
import 'package:meals_catalogue/helper/key_name.dart';
import 'package:meals_catalogue/view/menu_dessert.dart';
import 'package:meals_catalogue/view/menu_favorite.dart';
import 'package:meals_catalogue/view/menu_seafood.dart';
import 'package:meals_catalogue/view/search/search.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  var _children = [DessertScreen(), SeafoodScreen(), FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _children,
        index: _currentIndex,
      ),
      floatingActionButton: FloatingActionButton(
        key: Key(SEARCH_FAB),
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restaurant_menu,
              key: Key(BOT_NAV_DESSERT),
            ),
            title: Text('Dessert'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restaurant,
              key: Key(BOT_NAV_SEAFOOD),
            ),
            title: Text('Seafood'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              key: Key(BOT_NAV_FAVORITE),
            ),
            title: Text('Favorite'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
