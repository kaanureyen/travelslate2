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
  bool _focused1 = false;
  bool _focused2 = false;
  //FocusAttachment _nodeAttachment;//TODO: bi bak

  @override
  void initState() {
    super.initState();

    _node1 = FocusNode(debugLabel: 'Button1');
    _node1.addListener(_handleFocusChange1);
    //_nodeAttachment = _node1.attach(context, onKey: _handleKeyPress);//TODO: bi bak
    _node2 = FocusNode(debugLabel: 'Button2');
    _node2.addListener(_handleFocusChange2);
    //_nodeAttachment = _node2.attach(context, onKey: _handleKeyPress);//TODO: bi bak
  }

  void _handleFocusChange1() {
    if (_node1.hasFocus != _focused1) {
      setState(() {
        _focused1 = _node1.hasFocus;
        _node2.unfocus();
        _focused2 = false;
      });
    }
  }

  void _handleFocusChange2() {
    if (_node2.hasFocus != _focused2) {
      setState(() {
        _focused2 = _node2.hasFocus;
        _node1.unfocus();
        _focused1 = false;
      });
    }
  }

  /* bool _handleKeyPress(FocusNode focusnode, RawKeyEvent rawKeyEvent) {
    return true;
  }*/ //TODO: bi bak

  @override
  void dispose() {
    _node1.removeListener(_handleFocusChange1);
    _node2.removeListener(_handleFocusChange2);
    // The attachment will automatically be detached in dispose().

    super.dispose();
  }

  TextEditingController cnt1 = TextEditingController();
  TextEditingController cnt2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade700,
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
                          from = newValue;
                        });
                      },
                      items: languages.keys
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(languages[value]),
                        );
                      }).toList(),
                    ),
                    Expanded(
                      child: TextField(
                        expands: true,
                        minLines: null,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                            ),
                          ),
                        ),
                        maxLines: null,
                        onChanged: (s) async {
                          if (s != null && s != '') if (from != null &&
                              from != '' &&
                              to != null &&
                              to != '') {
                            var tmp = await translator.translate(s,
                                from: from, to: to);
                            setState(() {
                              cnt2.text = tmp;
                            });
                          }
                        },
                        controller: cnt1,
                        cursorColor: Colors.lightBlueAccent,
                        focusNode: _node1,
                        style: TextStyle(color: kIconColor, fontSize: 20),
                      ),
                    )
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
                          to = newValue;
                        });
                      },
                      items: enLanguages.keys
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(enLanguages[value]),
                        );
                      }).toList(),
                    ),
                    Expanded(
                      child: TextField(
                        expands: true,
                        minLines: null,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                            ),
                          ),
                        ),
                        maxLines: null,
                        onChanged: (s) async {
                          if (s != null && s != '') if (from != null &&
                              from != '' &&
                              to != null &&
                              to != '') {
                            var tmp = await translator.translate(s,
                                from: to, to: from);
                            setState(() {
                              cnt1.text = tmp;
                            });
                          }
                        },
                        controller: cnt2,
                        cursorColor: Colors.lightBlueAccent,
                        focusNode: _node2,
                        style: TextStyle(color: kIconColor, fontSize: 20),
                      ),
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
