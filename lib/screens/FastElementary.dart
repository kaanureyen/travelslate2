import 'package:flutter/material.dart';

class FastElementary extends StatefulWidget {
  @override
  _FastElementaryState createState() => _FastElementaryState();
}

class _FastElementaryState extends State<FastElementary> {

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
                       Row(
                         children: <Widget>[
                           Padding(padding: EdgeInsets.only(left:30)),
                           CircleAvatar(
                             backgroundColor:Colors.blueAccent,
                             child: Icon(
                               Icons.speaker_notes,
                               color: Colors.white,
                             ),
                           ),
                           Padding(padding: EdgeInsets.fromLTRB(10,20,0,30)),

                           Text("TEMEL ÖGELER",
                             style: TextStyle(
                               fontSize: 20,
                             ),
                           ),
                           ],
                       ),

                      Container(
                        color: Colors.grey[300],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                          ],
                        ),
                      ),

                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: <Widget>[
                            Container(
                              color: Colors.grey[300],
                              child: Text("TEMEL BİLGİLER",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                          Container(
                            color: Colors.grey[300],
                            child: Text("TANIŞMA", style: TextStyle(
                              fontSize: 17,
                            ),
                            ),
                          ),
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                            Container(
                              color: Colors.grey[300],
                              child: Text("YOL TARİFİ",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                            Container(
                              color: Colors.grey[300],
                              child: Text("DİL",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                            Container(
                              color: Colors.grey[300],
                              child: Text("PARA",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                            Container(
                              color: Colors.grey[300],
                              child: Text("GENEL",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[500],
                              child: const Center(child: Text('Entry B')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: const Center(child: Text('Entry C')),
                            ),
                            Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: const Center(child: Text('Entry A')),
                            ),

                          ],
                        ),
                      ),
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