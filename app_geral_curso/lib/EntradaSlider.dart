import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {

  double valor = 5;
  String label = "5";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body:Container(
        padding: EdgeInsets.all(60),
        child: Column(
          children: <Widget>[
            Slider(
                value: valor,
                min: 0,
                max: 10,
                divisions: 10,
                label: label,
                activeColor: Colors.greenAccent,
                inactiveColor: Colors.purple,
                onChanged: (double value){
                  setState(() {
                    valor = value;
                    label = value.toString();
                  });

                }
            ),
            RaisedButton(
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                onPressed: (){
                  print("Valor Selecionado: " + valor.toString());
                }
            )
          ],
        ),
      ),
    );
  }
}
