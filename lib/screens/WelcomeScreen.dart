import 'package:flutter/material.dart';
import '../consts.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              kImageColor,
              BlendMode.screen,
            ),
            image: AssetImage('images/img.jfif'),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(flex: 4, child: Container()),
              Container(
                decoration: BoxDecoration(
                  color: kTitleColor,
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightBlueAccent.shade100,
                      Colors.yellow, //lightGreenAccent.shade400,
                      Colors.yellow,
                      Colors.lightBlueAccent.shade100,
                    ],
                  ),
                ),
                child: Text(
                  'TRAVELSLATE',
                  style: TextStyle(
                    color: Colors.purple.shade900,
                    letterSpacing: 5,
                    fontSize: 40,
                    fontFamily: 'Monoton',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(flex: 7, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundButton(
                    icon: Icon(
                      Icons.text_fields,
                      size: 60,
                      color: kIconColor,
                    ),
                    size: 150,
                    onPressed: () {
                      Navigator.pushNamed(context, '/TextScreen');
                    },
                  ),
                  RoundButton(
                    icon: Icon(
                      Icons.mic,
                      size: 60,
                      color: kIconColor,
                    ),
                    size: 150,
                    onPressed: () {
                      Navigator.pushNamed(context, '/MicScreen');
                    },
                  ),
                ],
              ),
              Expanded(flex: 1, child: Container()),
              RoundButton(
                icon: Icon(
                  Icons.book,
                  size: 30,
                  color: kIconColor,
                ),
                size: 80,
                onPressed: () {
                  Navigator.pushNamed(context, '/FastScreen');
                },
              ),
              Expanded(flex: 2, child: Container()),
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BottomButton(
                        icondata: Icons.history,
                        onPressed: () {
                          Navigator.pushNamed(context, '/HistoryScreen');
                        }),
                    BottomButton(
                        icondata: Icons.favorite,
                        onPressed: () {
                          Navigator.pushNamed(context, '/FavoriteScreen');
                        }),
                    BottomButton(
                        icondata: Icons.settings,
                        onPressed: () {
                          Navigator.pushNamed(context, '/SettingsScreen');
                        }),
                    BottomButton(
                        icondata: Icons.more_horiz,
                        onPressed: () {
                          print('sa');
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
