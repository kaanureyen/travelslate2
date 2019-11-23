import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:translater/consts.dart';
import 'package:permission/permission.dart';

const languages = const [
  const Language('Türkçe', 'tr_TR'),
  const Language('Francais', 'fr_FR'),
  const Language('English', 'en_US'),
  const Language('Pусский', 'ru_RU'),
  const Language('Italiano', 'it_IT'),
  const Language('Español', 'es_ES'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class MicScreen extends StatefulWidget {
  @override
  _MicScreenState createState() => _MicScreenState();
}

class _MicScreenState extends State<MicScreen> {
  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = 'deneme';

  //String _currentLocale = 'en_US';
  Language selectedLang = languages.first;

  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setCurrentLocaleHandler(onCurrentLocale);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech
        .activate(); //.then((res) => setState(() => _speechRecognitionAvailable = res));
  }

  @override
  initState() {
    super.initState();
    requestPermission();
    activateSpeechRecognizer();
  }

  var currentMicrophoneIcon = Icons.mic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    transcription,
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
    );
  }

  void start() {
    _speech
        .listen(locale: selectedLang.code)
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
    setState(
        () => selectedLang = languages.firstWhere((l) => l.code == locale));
  }

  void onRecognitionStarted() => setState(() {
        _isListening = true;
        currentMicrophoneIcon = Icons.stop;
      });
  void onRecognitionResult(String text) => setState(() => transcription = text);
  void onRecognitionComplete() => setState(() {
        _isListening = false;
        currentMicrophoneIcon = Icons.mic;
      });

  void requestPermission() async {
    await Permission.requestPermissions([PermissionName.Microphone]);
    //holy code but might cause problems.
    //maybe check if it already has permissions?
    //if it works, don't change.
  }
}

/*
    var permissions = await Permission.getPermissionsStatus([PermissionName.Calendar, PermissionName.Camera]);

    var permissionNames = await Permission.requestPermissions([PermissionName.Calendar, PermissionName.Camera]);

    Permission.openSettings;
    */

/*

//..
_speech = SpeechRecognition();

// The flutter app not only call methods on the host platform,
// it also needs to receive method calls from host.
_speech.setAvailabilityHandler((bool result)
  => setState(() => _speechRecognitionAvailable = result));

// handle device current locale detection
_speech.setCurrentLocaleHandler((String locale) =>
 setState(() => _currentLocale = locale));

_speech.setRecognitionStartedHandler(()
  => setState(() => _isListening = true));

// this handler will be called during recognition.
// the iOS API sends intermediate results,
// On my Android device, only the final transcription is received
_speech.setRecognitionResultHandler((String text)
  => setState(() => transcription = text));

_speech.setRecognitionCompleteHandler(()
  => setState(() => _isListening = false));

// 1st launch : speech recognition permission / initialization
_speech
    .activate()
    .then((res) => setState(() => _speechRecognitionAvailable = res));
//..

speech.listen(locale:_currentLocale).then((result)=> print('result : $result'));

// ...

speech.cancel();

// ||

speech.stop();
 */
