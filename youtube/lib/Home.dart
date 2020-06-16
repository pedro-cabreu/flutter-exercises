import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/pages/Feed.dart';
import 'package:youtube/pages/Library.dart';
import 'package:youtube/pages/Subscriptions.dart';
import 'package:youtube/pages/Trending.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _primaryIndex = 0;
  String _res = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = [
      Feed(_res),
      Trending(),
      Subscriptions(),
      Library()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black45,
          opacity: 1,
        ),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async{
              String res = await showSearch(
                  context: context,
                  delegate: CustomSearchDelegate());
              setState(() {
                _res = res;
              });
            },
          ),

//          IconButton(
////            icon: Icon(Icons.videocam),
////            onPressed: (){
////
////            },
////          ),
////          IconButton(
////            icon: Icon(Icons.account_circle),
////            onPressed: (){
////
////            },
////          ),

        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: pages[_primaryIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _primaryIndex,
        onTap: (index){
          setState(() {
            _primaryIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text("Trending"),
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            title: Text("Subscriptions"),
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            title: Text("Library"),
            icon: Icon(Icons.folder)
          ),
        ]
      ),
    );
  }
}
