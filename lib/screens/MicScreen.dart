import 'package:flutter/material.dart';
import 'package:permission/permission.dart';
import 'package:translator/translator.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_speech_recognition/flutter_speech_recognition.dart';
import '../languages.dart';

class MicScreen extends StatefulWidget {
  @override
  _MicScreenState createState() => _MicScreenState();
}

class _MicScreenState extends State<MicScreen> {
  String from;
  String to;

  String ttsFrom;
  String ttsTo;
  String speechFrom;
  String speechTo;

  String transcription;
  String translation;

  FlutterTts flutterTts = FlutterTts();
  bool isTtsSpeaking = true;
  List<dynamic> langsTts;

  GoogleTranslator translator = GoogleTranslator();

  RecognitionController speech =
      FlutterSpeechRecognition.instance.voiceController();
  RecognitionController speech2 =
      FlutterSpeechRecognition.instance.voiceController();
  List<dynamic> langsRec;
  bool _isListening = true;

  void activateSpeechRecognizer() async {
    await speech.init();
    await speech2.init();
    langsRec = await speech.getAvailableLanguages();
  }

  void activateTts() async {
    flutterTts.setStartHandler(ttsStartHandler);
    flutterTts.setCompletionHandler(ttsCompletionHandler);
    flutterTts.setErrorHandler(ttsErrorHandler);

    langsTts = await flutterTts.getLanguages;

    await flutterTts.setSpeechRate(1.0);

    await flutterTts.setVolume(1.0);

    await flutterTts.setPitch(1.0);
  }

  @override
  initState() {
    super.initState();
    requestPermission();
    activateSpeechRecognizer();
    activateTts();
  }

  Future<bool> _onWillPop() {
    return speech
        .stop()
        .then((_) => speech2.stop())
        .then((_) => flutterTts.stop())
        .then((_) => true);
  }

  var dropdownValue1;
  var dropdownValue2;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: Colors.blue,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          DropdownButton(
                              value: dropdownValue1,
                              items: languages.keys
                                  .map<DropdownMenuItem<String>>(
                                      (a) => DropdownMenuItem(
                                          child: Text(
                                            languages[a],
                                            style: TextStyle(
                                                color: Color(0xD0000000)),
                                          ),
                                          value: a))
                                  .toList(),
                              onChanged: (s) => db(s, who: 1)),
                          DropdownButton(
                            value: dropdownValue2,
                            items: enLanguages.keys
                                .map<DropdownMenuItem<String>>(
                                    (a) => DropdownMenuItem(
                                        child: Text(
                                          enLanguages[a],
                                          style: TextStyle(
                                              color: Color(0xD0000000)),
                                        ),
                                        value: a))
                                .toList(),
                            onChanged: (s) => db(s, who: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(
                                  Icons.mic,
                                ),
                                iconSize: 100,
                                onPressed:
                                    _isListening ? null : () => ib1(who: 2)),
                            IconButton(
                              icon: Icon(
                                Icons.record_voice_over,
                              ),
                              iconSize: 100,
                              onPressed:
                                  isTtsSpeaking ? null : () => ib2(who: 2),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.mic,
                              ),
                              iconSize: 100,
                              onPressed:
                                  _isListening ? null : () => ib1(who: 1)),
                          IconButton(
                            icon: Icon(
                              Icons.record_voice_over,
                            ),
                            iconSize: 100,
                            onPressed: isTtsSpeaking ? null : () => ib2(who: 1),
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
      ),
    );
  }

  void ttsStartHandler() {
    setState(() {
      isTtsSpeaking = true;
    });
  }

  void ttsCompletionHandler() {
    setState(() {
      isTtsSpeaking = false;
    });
  }

  void ttsErrorHandler(dynamic dyn) {
    setState(() {
      isTtsSpeaking = false;
    });
  }

  void requestPermission() async {
    await Permission.requestPermissions([PermissionName.Microphone]);
  }

  void startTts(String text) async {
    var result = await flutterTts.speak(text);
    if (result == 1) setState(() => isTtsSpeaking = true);
  }

  void stopTts() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => isTtsSpeaking = false);
  }

  void db(dynamic s, {int who}) async {
    if (who == 1)
      setState(() {
        dropdownValue1 = s;
        from = s;
      });
    if (who == 2)
      setState(() {
        dropdownValue2 = s;
        to = s;
      });

    setState(() {
      _isListening = true;
    });
    setState(() {
      isTtsSpeaking = true;
    });

    for (String i in langsRec) {
      if (i.startsWith(to ?? ' ')) {
        speechTo = i;
      }
      if (i.startsWith(from ?? ' ')) {
        speech.setLanguage(i);
        speechFrom = i;
        setState(() {
          _isListening = false;
        });
      }
    }

    ////////////////////

    for (String i in langsTts) {
      if (i.startsWith(from ?? ' ')) {
        ttsFrom = i;
      }
      if (i.startsWith(to ?? ' ')) {
        flutterTts.setLanguage(i);
        speech2.setLanguage(speechTo);
        ttsTo = i;
        setState(() {
          isTtsSpeaking = false;
        });
      }
    }
  }

  void ib1({int who}) async {
    var _from = who == 1 ? from : to;
    var _to = who == 1 ? to : from;
    if (who == 2) {
      await flutterTts.setLanguage(ttsFrom);
      print(
          'ttsFrom: $ttsFrom _from: $_from _to: $_to speechTo:$speechTo speechFrom: $speechFrom');
    }

    Future<String> tmp;
    setState(() {
      _isListening = true;
    });
    (who == 1 ? speech : speech2).recognize().listen(
      (onData) {
        setState(
          () {
            transcription = onData;
            if (onData != null && onData != '')
              tmp = translator
                  .translate(
                    onData,
                    from: _from,
                    to: _to,
                  )
                  .then((s) => translation = s);
          },
        );
      },
      onDone: () async {
        var res = await tmp;
        if (!isTtsSpeaking) startTts(res);
        print(res);
        setState(() {
          _isListening = false;
        });
      },
    );
    if (who == 2) {
      await flutterTts.setLanguage(ttsTo);
    }
  }

  void ib2({int who}) async {
    if (who == 2) {
      await flutterTts.setLanguage(ttsFrom);
    }
    if (translation != null || translation != '') {
      startTts(translation);
    }
    if (who == 2) {
      await flutterTts.setLanguage(ttsTo);
    }
  }
}
