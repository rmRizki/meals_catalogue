import 'package:flutter/material.dart';
import 'data.dart';
import 'detail.dart';

class ListScreen extends StatelessWidget {
  final data = Data().data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bahan Makanan'),
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
