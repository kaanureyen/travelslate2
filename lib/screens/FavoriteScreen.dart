import 'package:flutter/material.dart';
import '../consts.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Colors.red,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(55.0),
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundColor: kButtonColor,
                  child: Icon(
                      Icons.favorite_border,
                          size: 100,
                          color: Colors.red,
                  ),
                ),
              ),
              Center(
                child: Text("İstediğiniz çeviriyi favorilere",
                  style: TextStyle(
                  fontSize: 20,
                  )

                ),
              ),
              Center(
                child: Text(
                  "eklemek için çeviri sayfasındaki",
                    style: TextStyle(
                      fontSize:20,
                    ),
                ),
              ),
              Center(
                child:Text(
                  "kalp simgesine dokunun.", style: TextStyle(
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
