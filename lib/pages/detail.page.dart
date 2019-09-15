import 'package:flutter/material.dart';
import 'package:flutter_github/models/github.model.dart';

class DetailPage extends StatelessWidget {
  final Item item;
  const DetailPage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(child: Text(item.fullName)),
    );
  }
}
