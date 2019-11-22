import 'package:flutter/material.dart';
import '../consts.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.green,
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
                    Icons.history,
                    size: 100,
                    color: Colors.green,
                  ),
                ),
              ),
              Center(
                child: Text("Henüz bir çeviri yapmadınız",
                    style: TextStyle(
                      fontSize: 20,
                    )

                ),
              ),

            ],
        ),
      ),
      ),
    );
  }
}
