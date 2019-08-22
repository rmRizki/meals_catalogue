import 'package:flutter/material.dart';
import 'package:meals_catalogue/api/meals_api.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final String img;

  DetailScreen(this.id, this.img);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool inner) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 270,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.img,
                  child: Image.network(widget.img, fit: BoxFit.fill),
                ),
              ),
            )
          ];
        },
        body: detailDesc(),
      ),
    );
  }

  Widget detailDesc() {
    return FutureBuilder(
      future: MealsApi().loadDataDetail(widget.id),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              var name = snapshot.data.detail[0].nameDetail;
              var desc = snapshot.data.detail[0].descDetail;
              return ListView(
                children: <Widget>[
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
                                  child: Text(name,
                                      style: TextStyle(fontSize: 32))),
                            ),
                            Text(desc, textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
        }
      },
    );
  }
}
