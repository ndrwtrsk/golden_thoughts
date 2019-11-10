import 'package:flutter/material.dart';
import 'package:golden_thoughts/src/training.dart';

void main() => runApp(GoldenThoughtsApp());

class GoldenThoughtsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golden Thoughts',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Golden thoughts'),
        ),
        body: Center(
          child: Text('your thoughts'),
        ),
      )
    );
  }
}