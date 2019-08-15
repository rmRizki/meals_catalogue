import 'package:flutter/material.dart';
import 'package:meals_catalogue/data/data_breakfast.dart';
import 'package:meals_catalogue/view/detail.dart';

class BreakfastScreen extends StatefulWidget {
  @override
  _BreakfastScreenState createState() => _BreakfastScreenState();
}

class _BreakfastScreenState extends State<BreakfastScreen> {
  var data = DataBreakfast().dataBreakfast;

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
          margin: EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Card(
              elevation: 8,
              child: GridTile(
                child: GestureDetector(
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
                footer: Container(
                  color: Colors.white70,
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
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
