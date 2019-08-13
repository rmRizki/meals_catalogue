import 'package:flutter/material.dart';
import 'package:meals_catalogue/data/data_breakfast.dart';
import 'detail.dart';

class BreakfastScreen extends StatefulWidget {
  @override
  _BreakfastScreenState createState() => _BreakfastScreenState();
}

class _BreakfastScreenState extends State<BreakfastScreen> {
  var data = DataBreakfast().dataBreakfast;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bahan Makanan'),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: data.length,
        itemBuilder: (context, index) {
          var name = data[index]['nama'];
          var desc = data[index]['desc'];
          var img = data[index]['img'];
          return GridTile(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  InkResponse(
                      child: Image.asset(
                        img,
                        fit: BoxFit.fill,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(name, desc, img),
                            ));
                      }),
                  Text(name)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
