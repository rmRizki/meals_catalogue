import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_catalogue/api/meals_api.dart';
import 'package:meals_catalogue/view/detail.dart';

class SeafoodScreen extends StatefulWidget {
  @override
  _SeafoodScreenState createState() => _SeafoodScreenState();
}

class _SeafoodScreenState extends State<SeafoodScreen> {
  Future future = MealsApi().loadDataSeafood();
  String category = "Seafood";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data.seafood.length,
                  itemBuilder: (context, index) {
                    var id = snapshot.data.seafood[index].idSeafood;
                    var name = snapshot.data.seafood[index].nameSeafood;
                    var img = snapshot.data.seafood[index].thumbSeafood;
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
                                  child: CachedNetworkImage(
                                    imageUrl: img,
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
