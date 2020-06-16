import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _savedString = "Empty!";
  TextEditingController _fieldController = TextEditingController();

  _save() async {

    String _typedValue = _fieldController.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("data", _typedValue); //Save the string
    print(_typedValue);
  }

  _get() async{

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedString = prefs.getString("data") ?? "Empty!";
    });

    print(_savedString);
  }

  _delete() async{

    final prefs = await SharedPreferences.getInstance();
    prefs.remove("data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saving User Preferences"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(12)),
            Text(
              _savedString,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Type something:"
              ),
              controller: _fieldController,

            ),
            Padding(padding: EdgeInsets.all(12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  splashColor: Colors.lightBlue,
                  onPressed: _save,
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: _get,
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Read",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: _delete,
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Delete",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
