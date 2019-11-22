import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../consts.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                      "İstediğiniz çeviriyi favorilere eklemek için çeviri sayfasındaki kalp simgesine dokunun.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: kButtonColor,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
