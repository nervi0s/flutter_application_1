import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Titulo 😃",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Titulo barra"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.arrow_downward), onPressed: pop),
          ],
          backgroundColor: new Color.fromARGB(255, 255, 0, 100),
        ),
        body: new Center(
          child: new Text(new WordPair.random().asCamelCase),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  void pop() {
    print("hola consola");
  }
}
