import 'package:flutter/material.dart';
import 'package:permission/permission.dart';
import 'package:translater/languages.dart';
import 'package:flutter_speech_recognition/flutter_speech_recognition.dart';
import 'package:flutter_tts/flutter_tts.dart';

const kIconSize = 80.0;
const kTextStyle = TextStyle(fontSize: 20, color: Color(0xFF000000));
const kIconColor = Color(0xC0000000);

class Language {
  String speechCode;
  String ttsCode;
  String name;
  Language({this.speechCode, this.ttsCode, this.name});
}

class MicScreen2 extends StatefulWidget {
  @override
  _MicScreen2State createState() => _MicScreen2State();
}

class _MicScreen2State extends State<MicScreen2> {
  String upsideText = 'up' * 30;
  String bottomText = 'bo' * 30;

  String dropdownValue1;
  String dropdownValue2;

  Map<String, String> map1 = {'a': 'A', 'b': 'B'};
  Map<String, String> map2 = {'c': 'C', 'd': 'D'};

  RecognitionController speech =
      FlutterSpeechRecognition.instance.voiceController();

  FlutterTts flutterTts = FlutterTts();

  Map<String, Language> langs = Map();

  initialize() async {
    List<String> speechLangs;
    var ttsLangs = await flutterTts.getLanguages;
    while (!await speech.init())
      print('retrying to initialize speech recognition');
    speechLangs = await speech.getAvailableLanguages();
    for (String i in languages.keys) {
      langs[i] = Language(name: languages[i]);
      for (String j in speechLangs) {
        if (j.startsWith(i)) {
          langs[i].speechCode = j;
          break;
        }
      }
      for (String j in ttsLangs) {
        if (j.startsWith(i)) {
          langs[i].ttsCode = j;
          break;
        }
      }
    }
    setState(() {
      map1.clear();
      map2.clear();
      for (String i in langs.keys) {
        if (langs[i].ttsCode != null && langs[i].speechCode != null) {
          map1[i] = langs[i].name;
          map2[i] = map1[i];
        }
      }
    });
  }

  @override
  void initState() {
    Permission.requestPermissions([PermissionName.Microphone])
        .then((_) => initialize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade50,
        child: SafeArea(
          child: Row(
            children: <Widget>[
              RotatedBox(
                quarterTurns: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade200,
                          borderRadius: BorderRadius.circular(1000)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          DropdownButton(
                            value: dropdownValue1,
                            items: map1.keys
                                .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          map1[value],
                                          style: kTextStyle,
                                        )))
                                .toList(),
                            onChanged: (s) => setState(
                              () {
                                dropdownValue1 = s;
                              },
                            ),
                          ),
                          DropdownButton(
                            value: dropdownValue2,
                            items: map2.keys
                                .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          map2[value],
                                          style: kTextStyle,
                                        )))
                                .toList(),
                            onChanged: (s) => setState(
                              () {
                                dropdownValue2 = s;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    RotatedBox(
                      quarterTurns: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.mic,
                            ),
                            iconSize: kIconSize,
                            color: kIconColor,
                            onPressed: () => print('mrb'),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.speaker_notes,
                            ),
                            color: kIconColor,
                            iconSize: kIconSize,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                              child: Text(upsideText, style: kTextStyle)),
                        ),
                      ),
                    ),
                    Divider(
                      indent: 40,
                      endIndent: 40,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Center(
                          child: Text(
                            bottomText,
                            style: kTextStyle,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.mic,
                          ),
                          color: kIconColor,
                          iconSize: kIconSize,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.speaker_notes,
                          ),
                          color: kIconColor,
                          iconSize: kIconSize,
                        ),
                      ],
                    ),
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
