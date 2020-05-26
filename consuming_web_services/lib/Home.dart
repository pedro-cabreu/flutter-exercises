import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _getPosts() async{

    http.Response response =  await http.get(_urlBase+"/posts");
    var jsonData = json.decode(response.body);

    List<Post> posts = List();

    for(var post in jsonData){
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      posts.add(p);
    }
    
    return posts;
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consuming Web Services (Advanced)"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: FutureBuilder<List<Post>>(
        future: _getPosts(),
        builder: (context, snapshot){

          String result;

          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if(snapshot.hasError){
              }else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){

                    List<Post> list = snapshot.data;
                    Post post = list[index];

                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
                );
              }
              break;
          }
          return null;
        },
      )
    );
  }
}
