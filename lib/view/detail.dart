import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String name, desc, img;

  DetailScreen(this.name, this.desc, this.img);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: img,
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Text(name),
            centerTitle: true,
          ),
          // Center(
          //     child: Text(
          //   name,
          //   style: TextStyle(fontSize: 32),
          // )),
          // Text(desc, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
