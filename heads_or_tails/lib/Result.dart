import 'package:flutter/material.dart';

class Result extends StatefulWidget {

  String value;

  Result(this.value);

  @override

  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {

    var directory;

    if(widget.value == "cara"){
      directory = "images/moeda_cara.png";
    }else{
      directory = "images/moeda_coroa.png";
    }

    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(directory),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
                child: Image.asset("images/botao_voltar.png"),
            )
          ],
        ),
      ),
    );
  }
}
