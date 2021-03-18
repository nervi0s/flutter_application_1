import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Titulo 😃",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Titulo barra"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.arrow_downward), onPressed: pop),
          ],
        ),
        body: Center(
          child: Text(WordPair.random().asCamelCase),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  void pop() {
    print("holaa");
  }
}
