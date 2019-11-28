import 'package:flutter/material.dart';
import 'package:translater/consts.dart';

class FastFavorites extends StatefulWidget {
  @override
  _FastFavoritesState createState() => _FastFavoritesState();
}

class _FastFavoritesState extends State<FastFavorites> {

  List<String> _locations = ['A', 'B', 'C', 'D', 'Abdürrezzak Kıllıbacak'];
  String dropdown1;
  String dropdown2;

  void method() {
    var temp;
    dropdown1=temp;
    dropdown1=dropdown2;
    dropdown2=temp;
  }

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        home: Scaffold(
        resizeToAvoidBottomPadding: false,
          body: SafeArea(
            child: Container(
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Gezi Sözlüğü",
                      style:TextStyle(
                      fontSize: 40,
                          ),
                        ),
                        ],
                        ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                      child: Container(
                        color: Colors.grey[300],
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                          border: InputBorder.none,
                            hintText: "Arama"

                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 90,
                ),
                  CircleAvatar(
                    radius: 75,
                    backgroundColor: kButtonColor,
                    child: Icon(
                        Icons.favorite_border,
                    size: 75,
                        color: Colors.grey[300]),
                ),
                  Padding(padding: EdgeInsets.only(bottom:100)),
                  Text(
                    "İstediğiniz çeviriyi favorilere eklemek için kalp simgesine dokunun"
                  ),
                  Padding(padding: EdgeInsets.only(bottom:50)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OutlineButton(
                          color: Colors.yellowAccent,
                          child: Icon(Icons.compare_arrows),
                          onPressed: method,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DropdownButton(
                        hint: Text('Dil'),
                        value: dropdown1,
                        onChanged: (newValue) {
                          setState(() {
                            dropdown1 = newValue;
                          });
                        },
                        items: _locations.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),



                      DropdownButton(
                        hint: Text('Dil'),
                        value: dropdown2,
                        onChanged: (newValue) {
                          setState(() {
                            dropdown2 = newValue;
                          });
                        },
                        items: _locations.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),


                    ],
                  ),




                ],
                  ),
                   ),
                  ),
        ),
     );
  }
}
