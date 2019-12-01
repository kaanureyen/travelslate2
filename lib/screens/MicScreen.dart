import 'package:flutter/material.dart';
import 'package:permission/permission.dart';
import 'package:translater/languages.dart';
import 'package:flutter_speech_recognition/flutter_speech_recognition.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

const kIconSize = 80.0;
const kTextStyle = TextStyle(fontSize: 20, color: Colors.black);
const kIconColor = Color(0xC0000000);
const kDefaultText = 'Select languages and press microphone icons!';

class Language {
  String speechCode;
  String ttsCode;
  String name;
  Language({this.speechCode, this.ttsCode, this.name});
}

class MicScreen extends StatefulWidget {
  @override
  _MicScreenState createState() => _MicScreenState();
}

class _MicScreenState extends State<MicScreen> {
  String upsideText;
  String bottomText;

  String dropdownValue1;
  String dropdownValue2;

  Map<String, String> map = Map();

  RecognitionController speech =
      FlutterSpeechRecognition.instance.voiceController();

  FlutterTts flutterTts = FlutterTts();

  GoogleTranslator translate = GoogleTranslator();

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
      for (String i in langs.keys) {
        if (langs[i].ttsCode != null && langs[i].speechCode != null) {
          map[i] = langs[i].name;
        }
      }
    });
  }

  void botMic() async {
    if (dropdownValue1 != null &&
        dropdownValue1 != '' &&
        dropdownValue2 != null &&
        dropdownValue2 != '') {
      speech.setLanguage(langs[dropdownValue1].speechCode);
      flutterTts.setLanguage(langs[dropdownValue2].ttsCode);
      Future<String> tmp;
      String tmp2;
      speech.recognize().listen(
        (s) async {
          if (s != null && s != '') {
            tmp = translate.translate(s,
                from: dropdownValue1, to: dropdownValue2);
            tmp2 = await tmp;
            setState(
              () {
                bottomText = s;
                upsideText = tmp2;
              },
            );
          }
        },
      ).onDone(
        () async => flutterTts.speak(
            await tmp), //looks stupid but otherwise doesn't read right thing
      );
    }
  }

  void upMic() async {
    if (dropdownValue1 != null &&
        dropdownValue1 != '' &&
        dropdownValue2 != null &&
        dropdownValue2 != '') {
      speech.setLanguage(langs[dropdownValue2].speechCode);
      flutterTts.setLanguage(langs[dropdownValue1].ttsCode);
      Future<String> tmp;
      String tmp2;
      speech.recognize().listen(
        (s) async {
          if (s != null && s != '') {
            tmp = translate.translate(s,
                from: dropdownValue2, to: dropdownValue1);
            tmp2 = await tmp;
            setState(
              () {
                bottomText = tmp2;
                upsideText = s;
              },
            );
          }
        },
      ).onDone(
        () async => flutterTts.speak(
            await tmp), //looks stupid but otherwise doesn't read right thing
      );
    }
  }

  void botTts() async {
    if (dropdownValue1 != null &&
        dropdownValue1 != '' &&
        bottomText != null &&
        bottomText != '') {
      await flutterTts.setLanguage(langs[dropdownValue1].ttsCode);
      flutterTts.speak(bottomText);
    }
  }

  void upTts() async {
    if (dropdownValue2 != null &&
        dropdownValue2 != '' &&
        upsideText != null &&
        upsideText != '') {
      await flutterTts.setLanguage(langs[dropdownValue2].ttsCode);
      flutterTts.speak(upsideText);
    }
  }

  void dd1(String s) async {
    setState(() {
      dropdownValue1 = s;
    });
  }

  void dd2(String s) async {
    setState(() {
      dropdownValue2 = s;
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
                            items: map.keys
                                .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          map[value],
                                          style: kTextStyle,
                                        )))
                                .toList(),
                            onChanged: (s) => dd1(s),
                          ),
                          DropdownButton(
                            value: dropdownValue2,
                            items: map.keys
                                .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          map[value],
                                          style: kTextStyle,
                                        )))
                                .toList(),
                            onChanged: (s) => dd2(s),
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
                            onPressed: () => upMic(),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.speaker_notes,
                            ),
                            color: kIconColor,
                            iconSize: kIconSize,
                            onPressed: () => upTts(),
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
                            child: Text(upsideText ?? kDefaultText,
                                style: kTextStyle),
                          ),
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
                            bottomText ?? kDefaultText,
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
                          onPressed: () => botMic(),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.speaker_notes,
                          ),
                          color: kIconColor,
                          iconSize: kIconSize,
                          onPressed: () => botTts(),
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
