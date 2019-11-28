import 'package:flutter/material.dart';

class FavoriteFullScreen extends StatefulWidget {
  @override
  _FavoriteFullScreenState createState() => _FavoriteFullScreenState();
}

class _FavoriteFullScreenState extends State<FavoriteFullScreen> {
  Color myColor=Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Travelslate",style: TextStyle(
            color: myColor,
            ),
            ),
            Row(
              children: <Widget>[

              ],
            ),
          ],
        ),
      ),
    );
  }
}
