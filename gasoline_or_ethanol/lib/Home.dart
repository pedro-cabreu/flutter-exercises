import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerEthanol = TextEditingController();
  TextEditingController _controllerGasoline = TextEditingController();
  var _resultText = "";

  void _calculate() {

    double ethanolPrice = double.tryParse(_controllerEthanol.text);
    double gasolinePrice = double.tryParse(_controllerGasoline.text);


    if (ethanolPrice == null || gasolinePrice == null) {
        setState(() {
          _resultText = "Número inválido, digite números maiores que 0  e utlizando (.)";
        });
    }else{
        if((ethanolPrice/gasolinePrice) >= 0.7){
          setState(() {
            _resultText = "Melhor abastecer com gasolina";
          });
        }else{
          setState(() {
            _resultText = "Melhor abastecer com álcool";
          });
        }
        _cleanFields();
    }

  }

  void _cleanFields(){
    _controllerGasoline.text = "";
    _controllerEthanol.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou gasolina"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro.",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Preço Álcool, EX: 1.59"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerEthanol,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, EX: 2.59"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasoline,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: _calculate,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                    _resultText,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
