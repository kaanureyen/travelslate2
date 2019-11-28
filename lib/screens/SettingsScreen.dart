import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  Color _myColor1 = Colors.green;
  Color _myColor2= Colors. green;
  String myText1="On";
  String myText2="On";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Column(
        children: <Widget>[
          Text("Ayarlar", style: TextStyle(
            color: Colors.black,
            fontSize: 40,
          ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 20)),
          Row(
            children: <Widget>[
              Icon(Icons.surround_sound,
              size: 30, color: Colors.green),
              Padding(padding: EdgeInsets.only(right: 30)
              ),
              Text("Otomatik Seslendirme",style:TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 70),
              ),
              ButtonTheme(
                height: 25,
                minWidth: 50,
                child: RaisedButton(
                    child: new Text(myText1), color: _myColor1, onPressed: () {
                  setState(() {
                    if (_myColor1 == Colors.green) {
                      myText1="Off";
                      _myColor1 = Colors.red;
                    }
                    else {
                      myText1="On";
                      _myColor1 = Colors.green;
                    }
                  });
                }),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.text_fields,
                  size: 30, color: Colors.green),
              Padding(padding: EdgeInsets.only(right: 30)
              ),
              Text("Otomatik Büyük Harf",style:TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 78),
              ),
              ButtonTheme(
                height: 25,
                minWidth: 50,
                child: RaisedButton(
                    child: new Text(myText2), color: _myColor2, onPressed: () {
                  setState(() {
                    if (_myColor2 == Colors.green) {
                      myText2="Off";
                      _myColor2 = Colors.red;
                    }
                    else {
                      myText2="On";
                      _myColor2 = Colors.green;
                    }
                  });
                }),
              ),
            ],
          ),
        ],
       ),
     ),
    );
  }
}