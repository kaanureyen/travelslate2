import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/WelcomeScreen.dart';
import 'screens/TextScreen.dart';
import 'screens/SettingsScreen.dart';
import 'screens/MicScreen.dart';
import 'screens/HistoryScreen.dart';
import 'screens/FastScreen.dart';
import 'screens/FavoriteScreen.dart';

void main() =>
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      runApp(MainApp());
    });

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travelslate',
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/TextScreen': (context) => TextScreen(),
        '/SettingsScreen': (context) => SettingsScreen(),
        '/MicScreen': (context) => MicScreen(),
        '/HistoryScreen': (context) => HistoryScreen(),
        '/FastScreen': (context) => FastScreen(),
        '/FavoriteScreen': (context) => FavoriteScreen(),
      },
    );
  }
}
//test commit
