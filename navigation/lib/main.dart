import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/SecondaryScreen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/secondary": ( context ) => SecondaryScreen(),
    },
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Ir para segunda tela"),
              padding: EdgeInsets.all(15),
              onPressed: (){
                Navigator.pushNamed(context, "/secondary");
              },
            )
          ],
        ),
      ),
    );
  }
}
