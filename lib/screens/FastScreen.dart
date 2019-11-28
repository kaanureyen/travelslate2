import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:translater/consts.dart';
import 'FastFavorites.dart';
import 'FastElementary.dart';
import 'FastTravelAndGuidance.dart';
import 'FastAccomodation.dart';
import 'FastRestaurant.dart';
import 'FastDateTimeNumbers.dart';
import 'FastHealth.dart';
import 'FastShopAndShopping.dart';

class FastScreen extends StatefulWidget {
  @override
  _FastScreenState createState() => _FastScreenState();
}

class _FastScreenState extends State<FastScreen> {

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
                Container(
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FastFavorites()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:Colors.green,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 10)),

                            Text("Favoriler",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_forward,
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FastElementary()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:Colors.blueAccent,
                              child: Icon(
                                Icons.speaker_notes,
                                color: Colors.white,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 10)),

                            Text("Temel Öğeler",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_forward,

                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FastTravelAndGuidance()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:Colors.purpleAccent,
                              child: Icon(
                                Icons.train,
                                color: Colors.white,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 10)),

                            Text("Seyahat ve Yol Tarifi",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              child: Container(

                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.arrow_forward),
                              ],
                            ),

                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FastAccomodation()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:Colors.indigo[900],
                              child: Icon(
                                Icons.hotel,
                                color: Colors.white,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 10)),

                            Text("Konaklama",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.arrow_forward),
                              ],
                            ),

                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FastRestaurant()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:Colors.yellowAccent,
                              child: Icon(
                                Icons.restaurant,
                                color: Colors.white,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 10)),

                            Text("Restoran ve Bar",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.arrow_forward),
                              ],
                            ),

                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FastShopAndShopping()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:Colors.lightGreenAccent,
                              child: Icon(
                                Icons.restaurant,
                                color: Colors.white,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 10)),

                            Text("Mağaza ve Alışveriş",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.arrow_forward),
                              ],
                            ),

                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FastDateTimeNumbers()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:Colors.teal,
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 10)),

                            Text("Tarih/Saat/Sayılar",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.arrow_forward),
                              ],
                            ),

                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FastHealth()),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:Colors.redAccent,
                              child: Icon(
                                Icons.healing,
                                color: Colors.white,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 10)),

                            Text("Sağlık",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.arrow_forward),
                              ],
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                        crossAxisAlignment: CrossAxisAlignment.end,
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

              ],
            ),
          ),
        ),
      ),
    );

  }


}
