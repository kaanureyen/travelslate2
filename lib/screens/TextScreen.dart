import 'package:flutter/material.dart';
import 'package:translater/consts.dart';
import 'package:translator/translator.dart';
import '../languages.dart';

class TextScreen extends StatefulWidget {
  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  String from;
  String to;
  String dropdownValue1;
  String dropdownValue2;

  GoogleTranslator translator = GoogleTranslator();
  FocusNode _node1;
  FocusNode _node2;
  bool _focused = false;
  FocusAttachment _nodeAttachment;

  @override
  void initState() {
    super.initState();

    _node1 = FocusNode(debugLabel: 'Button1');
    _node1.addListener(_handleFocusChange1);
    _nodeAttachment = _node1.attach(context, onKey: _handleKeyPress);
    _node2 = FocusNode(debugLabel: 'Button2');
    _node2.addListener(_handleFocusChange2);
    _nodeAttachment = _node2.attach(context, onKey: _handleKeyPress);
  }

  void _handleFocusChange1() {
    if (_node1.hasFocus != _focused) {
      setState(() {
        _focused = _node1.hasFocus;
      });
    }
  }

  void _handleFocusChange2() {
    if (_node2.hasFocus != _focused) {
      setState(() {
        _focused = _node2.hasFocus;
      });
    }
  }

  bool _handleKeyPress(FocusNode focusnode, RawKeyEvent rawKeyEvent) {
    return true;
  }

  @override
  void dispose() {
    _node1.removeListener(_handleFocusChange1);
    _node2.removeListener(_handleFocusChange2);
    // The attachment will automatically be detached in dispose().

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController cnt1 = TextEditingController(text: dropdownValue1);
    TextEditingController cnt2 = TextEditingController(text: dropdownValue2);
    for (var i in languages.keys) {
      if (languages[i] == dropdownValue1) {
        from = i;
        print('from: $i');
      }
    }
    for (var i in enLanguages.keys) {
      if (enLanguages[i] == dropdownValue2) {
        to = i;
        print('to: $i');
      }
    }
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DropdownButton<String>(
                      value: dropdownValue1,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: kIconColor,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                        color: kIconColor,
                      ),
                      underline: Container(
                        height: 2,
                        color: kIconColor,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue1 = newValue;
                        });
                      },
                      items: languages.values
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    EditableText(
                      onChanged: (s) {
                        if (s != null && s != '') if (from != null &&
                            from != '' &&
                            to != null &&
                            to != '')
                          translator
                              .translate(s, from: from, to: to)
                              .then((s) => cnt2.text = s);
                      },
                      backgroundCursorColor: kIconColor,
                      controller: cnt1,
                      cursorColor: Colors.lightBlueAccent,
                      focusNode: FocusNode(),
                      style: TextStyle(color: kIconColor, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DropdownButton<String>(
                      value: dropdownValue2,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: kIconColor,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: kIconColor),
                      underline: Container(
                        height: 2,
                        color: kIconColor,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue2 = newValue;
                        });
                      },
                      items: enLanguages.values
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    EditableText(
                      onChanged: (s) {
                        if (s != null && s != '') if (from != null &&
                            from != '' &&
                            to != null &&
                            to != '')
                          translator
                              .translate(s, from: from, to: to)
                              .then((s) => cnt1.text = s);
                      },
                      backgroundCursorColor: kIconColor,
                      controller: cnt2,
                      cursorColor: Colors.lightBlueAccent,
                      focusNode: FocusNode(),
                      style: TextStyle(color: kIconColor, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
