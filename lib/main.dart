import 'package:flutter/material.dart';
import 'package:flutter_github/pages/search.page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  final title = 'Search Github Repositories';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SearchPage(),
      ),
    );
  }
}