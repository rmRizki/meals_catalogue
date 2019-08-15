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
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: img,
                child: Image.asset(img, fit: BoxFit.fill),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
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
                                child: Text(name, style: TextStyle(fontSize: 32))),
                          ),
                          Text(desc, textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
