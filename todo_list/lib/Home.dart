import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _todo = [];

//  _getFile usa a biblioteca path provider para localizar e pegar o arquivo dos dados e retorna o arquivo

  Future<File> _getFile() async{
    final directory = await getApplicationDocumentsDirectory();
    var file = File( "${directory.path}/data.json" );

    return file;
  }

// _saveData instancia uma variavel file com o file retonado da _getFile, cria um mapa de tarefas e escreve no disco

  _saveData() async {

    var file = await _getFile();

    Map<String, dynamic> task = Map();
    task["title"] = "Study Flutter";
    task["done"] = false;
    _todo.add( task );

    String data = json.encode(_todo);
    file.writeAsString(data);
  }

  _readFile() async {

    try{
      final file = await _getFile();
      file.readAsString();


    }catch(e){
      return null;
    }

  }

  @override
  void initState() {

    super.initState();
    _readFile().then((data){
      setState(() {
        _todo = json.decode(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        title: Text(
          "To-do List",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), //Nice effect
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20),)
          ],
        )
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _todo.length,
              itemBuilder: (context, index){

                return ListTile(
                  title: Text(_todo[index]['title']),
                );
              }
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        elevation: 6,
        splashColor: Colors.black12,
        mini: true,
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Add task"),
                content: TextField(
                  decoration: InputDecoration(
                    labelText: "Enter your task:"
                  ),
                  onChanged: (text){

                  },
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  ),
                  FlatButton(
                    onPressed: (){

                      Navigator.pop(context);
                    },
                    child: Text("Save"),
                  ),
                ],
              );
            }
          );
        },
      ),
    );
  }
}
