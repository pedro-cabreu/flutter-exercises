import 'package:flutter/material.dart';

class SecondaryScreen extends StatefulWidget {

  String value;

  SecondaryScreen({this.value});

  @override
  _SecondaryScreenState createState() => _SecondaryScreenState();
}

class _SecondaryScreenState extends State<SecondaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Secondary Screen"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text("Segunda Tela"),
            RaisedButton(
              child: Text("Ir para primeira tela"),
              padding: EdgeInsets.all(15),
              onPressed: (){
                Navigator.pushNamed(context, "/");
              },
            )
          ],
        ),
      ),
    );
  }
}
