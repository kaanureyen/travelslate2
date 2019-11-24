import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:permission/permission.dart';
import 'package:translator/translator.dart';

class MicScreen extends StatefulWidget {
  @override
  _MicScreenState createState() => _MicScreenState();
}

String transcription;
String translation;

class _MicScreenState extends State<MicScreen> {
  var translator = GoogleTranslator();

  SpeechRecognition _speech;

  bool _speechRecognitionAvailable;
  static bool _isListening = false;
  var currentMicrophoneIcon = (!_isListening ? Icons.mic : Icons.stop);

  String selectedLang;

  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setCurrentLocaleHandler(onCurrentLocale);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.activate();
    //.then((res) => setState(() => _speechRecognitionAvailable = res));
    //şu an problem yaratıyor mikrofon açıkken sayfayı kapatıp açınca. başka bir yerden çağrılmalı / çağrılmamalı
  }

  @override
  initState() {
    super.initState();
    requestPermission();
    currentMicrophoneIcon = (!_isListening ? Icons.mic : Icons.stop);
    activateSpeechRecognizer();
  }

  Future<bool> _onWillPop() {
    _speech.stop();
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
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
                  IconButton(
                    icon: Icon(
                      currentMicrophoneIcon,
                    ),
                    iconSize: 200,
                    onPressed: !_isListening
                        ? () {
                            start();
                          }
                        : () {
                            stop();
                          },
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void start() {
    _speech
        .listen(locale: selectedLang)
        .then((result) => print('_MyAppState.start => result $result'));
  }

  void cancel() {
    _speech.cancel().then((result) => setState(() => _isListening = result));
  }

  void stop() {
    _speech.stop().then((result) => setState(() => _isListening = result));
  }

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
    print('_MyAppState.onCurrentLocale... $locale');
    setState(() => selectedLang = locale);
  }

  void onRecognitionStarted() => setState(() {
        _isListening = true;
        currentMicrophoneIcon = Icons.stop;
      });
  void onRecognitionResult(String text) => setState(() async {
        if (text != null && text != '') {
          setState(() {
            transcription = text;
          });
          updateAndTranslate(text);
        }
      });
  void onRecognitionComplete() => setState(() {
        _isListening = false;
        currentMicrophoneIcon = Icons.mic;
      });

  void updateAndTranslate(String text) async {
    String cac = await translator.translate(text, to: 'en');
    setState(() {
      translation = cac;
    });
  }

  void requestPermission() async {
    await Permission.requestPermissions([PermissionName.Microphone]);
    //holy code but might cause problems.
    //maybe check if it already has permissions?
    //if it works, don't change.
  }
}
