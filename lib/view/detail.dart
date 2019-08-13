import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String name, desc, img;

  DetailScreen(this.name, this.desc, this.img);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Bahan Makanan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            img,
            width: 600,
            height: 200,
            fit: BoxFit.cover,
          ),
          Center(
              child: Text(
            name,
            style: TextStyle(fontSize: 32),
          )),
          Text(desc, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
