import 'package:flutter/material.dart';
import 'package:meals_catalogue/data/data_dessert.dart';
import 'package:meals_catalogue/view/detail.dart';

class DessertScreen extends StatefulWidget {
  @override
  _DessertScreenState createState() => _DessertScreenState();
}

class _DessertScreenState extends State<DessertScreen> {
  var data = DataDessert().dataDessert;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: data.length,
      itemBuilder: (context, index) {
        var name = data[index]['nama'];
        var desc = data[index]['desc'];
        var img = data[index]['img'];
        return Container(
          padding: EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Card(
              elevation: 8,
              child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
                child: InkResponse(
                    child: Hero(
                      tag: img,
                      child: Image.asset(
                        img,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(name, desc, img),
                          ));
                    }),
              ),
            ),
          ),
        );
      },
    );
  }
}
