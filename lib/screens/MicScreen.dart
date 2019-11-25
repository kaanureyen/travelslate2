import 'package:flutter/material.dart';
import 'package:permission/permission.dart';
import 'package:translator/translator.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_speech_recognition/flutter_speech_recognition.dart';

class MicScreen extends StatefulWidget {
  @override
  _MicScreenState createState() => _MicScreenState();
}

class _MicScreenState extends State<MicScreen> {
  String from = 'tr';
  String to = 'de';
  String transcription;
  String translation;

  FlutterTts flutterTts = FlutterTts();
  bool isTtsSpeaking = false;
  List<dynamic> langsTts;

  GoogleTranslator translator = GoogleTranslator();

  RecognitionController speech =
      FlutterSpeechRecognition.instance.voiceController();
  List<dynamic> langsRec;
  bool _isListening = false;

  void activateSpeechRecognizer() async {
    await speech.init();
    langsRec = await speech.getAvailableLanguages();
    setState(() {
      _isListening = true;
    });

    for (String i in langsRec) {
      if (i.startsWith(from)) {
        setState(() {
          _isListening = false;
        });
        await speech.setLanguage(i);
        break;
      }
    }
  }

  void activateTts() async {
    flutterTts.setStartHandler(ttsStartHandler);
    flutterTts.setCompletionHandler(ttsCompletionHandler);
    flutterTts.setErrorHandler(ttsErrorHandler);

    langsTts = await flutterTts.getLanguages;
    setState(() {
      isTtsSpeaking = true;
    });

    for (String i in langsTts) {
      if (i.startsWith(to)) {
        setState(() {
          isTtsSpeaking = false;
        });
        await flutterTts.setLanguage(i);
        break;
      }
    }

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
    speech.stop(); //TODO: bi bak bu ne returnleyecek
    flutterTts.stop();
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    Future<String> tmp;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: Colors.blue,
          child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      (transcription != null ? transcription : 'Input Voice') +
                          '\n\n' +
                          (translation != null ? translation : 'Translation'),
                      style: TextStyle(
                        fontSize: 20,
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
                          iconSize: 100,
                          onPressed: !_isListening
                              ? () {
                                  setState(() {
                                    _isListening = true;
                                  });
                                  speech.recognize().listen(
                                    (onData) {
                                      setState(
                                        () {
                                          transcription = onData;
                                          if (onData != null && onData != '')
                                            tmp = translator
                                                .translate(
                                                  onData,
                                                  from: from,
                                                  to: to,
                                                )
                                                .then((s) => translation = s);
                                        },
                                      );
                                    },
                                    onDone: () async {
                                      var res = await tmp;
                                      setState(
                                        () {
                                          startTts(res);
                                          _isListening = false;
                                        },
                                      );
                                    },
                                  );
                                }
                              : null),
                      IconButton(
                        icon: Icon(
                          Icons.record_voice_over,
                        ),
                        iconSize: 100,
                        onPressed: isTtsSpeaking ||
                                translation == null ||
                                translation == ''
                            ? null
                            : () => startTts(translation),
                      ),
                    ],
                  ),
                ]),
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
}
