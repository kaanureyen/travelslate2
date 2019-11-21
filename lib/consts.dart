import 'package:flutter/material.dart';

const kButtonColor = Color(0x80FFFFFF);
const kIconColor = Color(0xB0000000);
const kImageColor = Color(0x408B5770);
const kTitleColor = Color(0xB0000000);

IconButton bottomButton({IconData icondata, Function onPressed}) {
  return IconButton(
    icon: Icon(
      icondata,
      size: 40,
    ),
    color: kButtonColor,
    onPressed: onPressed,
  );
}

RawMaterialButton roundButton(
    {double size, Icon icon, @required Function onPressed}) {
  return RawMaterialButton(
    constraints: BoxConstraints.expand(
      width: size,
      height: size,
    ),
    fillColor: kButtonColor,
    //s.yellow.shade600,
    shape: CircleBorder(),
    onPressed: onPressed,
    child: icon,
  );
}
