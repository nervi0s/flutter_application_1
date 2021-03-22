import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final Mensaje mensaje = new Mensaje();

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
          child: new RandomWords(), //child: mensaje,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  void pop() {
    //mensaje.click();
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RandomWordsState();
  }
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _combinaciones = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _construirCombinacion(),
    );
  }

  //funcion para generar una lista con combinaciones de dos palabras aleatrorias
  Widget _construirCombinacion() {
    return ListView.builder(
      itemBuilder: indexedWidgetBuilder,
    );
  }

  //Funcion que implementa el tipo definido "IndexedWidgetBuilder typedef"
  Widget indexedWidgetBuilder(BuildContext context, int i) {
    if (i.isOdd) {
      return new Divider();
    } else {
      //Eficiencia
      if (i >= _combinaciones.length) {
        _combinaciones.add(WordPair.random());
      }
      print(
          '${_combinaciones.length} <- tamaño de la lista -- ${_combinaciones[i ~/ 2]} <- retornado');
      return _construirUnaFila(_combinaciones[i ~/ 2]);
    }
  }

  //Función que construte una file de la lista
  Widget _construirUnaFila(WordPair parDePalabras) {
    return new ListTile(
      title: new Text(parDePalabras.asCamelCase),
    );
  }
}

//Clase que será un StatefulWidget
class Mensaje extends StatefulWidget {
  final Estado estado = new Estado();

  @override
  State<StatefulWidget> createState() {
    return estado;
  }

  void click() {
    estado.ran();
  }
}

//CLase que acompaña con un estado State a la clase de arriba
class Estado extends State<Mensaje> {
  WordPair wp = new WordPair.random();
  String wordPair;

  @override
  Widget build(BuildContext context) {
    wordPair = wp.asCamelCase;
    return new Container(
      color: Color.fromARGB(200, 255, 20, 23),
      padding: EdgeInsets.all(20),
      child: new Text(wordPair),
    );
  }

  void ran() {
    setState(() {
      wp = new WordPair.random();
      wordPair = wp.asCamelCase;
    });
  }
}
