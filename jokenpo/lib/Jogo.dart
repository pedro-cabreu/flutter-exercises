import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _standardMessage = "Escolha uma opção abaixo:";

  void _selectedOption(String userChoice){

    var options = ["Pedra", "Papel", "Tesoura"];
    var n = Random().nextInt(3);
    var appChoice = options[n];

    switch(appChoice){

      case "Pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;

        case "Papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;

        case "Tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if(
      (userChoice == "Pedra" && appChoice == "Tesoura") ||
      (userChoice == "Tesoura" && appChoice == "Papel") ||
      (userChoice == "Papel" && appChoice == "Pedra")
    ){
      setState(() {
        this._standardMessage = "Parabéns você ganhou!";
      });
    }else if(
      (appChoice == "Pedra" && userChoice == "Tesoura") ||
      (appChoice == "Tesoura" && userChoice == "Papel") ||
      (appChoice == "Papel" && userChoice == "Pedra")
    ){
      setState(() {
        this._standardMessage = "Você Perdeu!";
      });
    }else{
      setState(() {
        this._standardMessage = "Empate!";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._standardMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => _selectedOption("Pedra"),
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _selectedOption("Papel"),
                child: Image.asset("images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _selectedOption("Tesoura"),
                child: Image.asset("images/tesoura.png", height: 100),
              ),
            ],
          )
        ],
      ),
    );
  }
}
