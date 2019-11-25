import 'package:flutter/material.dart';

class FastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlatButton(
                onPressed: (){

                },
                child: Text("Favoriler",
                style: TextStyle(
                  fontSize: 20,
              ),
              ),
              ),
              FlatButton(
                onPressed: (){

                },
                child: Text("Temel Öğeler",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){

                },
                child: Text("Seyahat ve Yol Tarifi",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){

                },
                child: Text("Konaklama",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){

                },
                child: Text("Restoran ve Bar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){

                },
                child: Text("Mağaza ve Alışveriş",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){

                },
                child: Text("Tarih/Saat/Sayılar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              FlatButton(
                onPressed: (){

                },
                child: Text("Sağlık",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
