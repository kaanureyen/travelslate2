import 'package:flutter/material.dart';

class FastElementary extends StatefulWidget {
  @override
  _FastElementaryState createState() => _FastElementaryState();
}

class _FastElementaryState extends State<FastElementary> {
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
                           Padding(padding: EdgeInsets.only(right: 10)),

                           Text("TEMEL ÖGELER",
                             style: TextStyle(
                               fontSize: 20,
                             ),
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