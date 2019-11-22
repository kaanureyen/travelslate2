import 'package:flutter/material.dart';

const kButtonColor = Color(0xCFFFFFFF);
const kIconColor = Color(0xB0000000);
const kImageColor = Color(0x408B5770);
const kTitleColor = Color(0xCF000000);

class BottomButton extends StatelessWidget {
  final IconData icondata;
  final Function onPressed;
  BottomButton({this.icondata, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icondata,
        size: 40,
      ),
      color: kButtonColor,
      onPressed: onPressed,
    );
  }
}

class RoundButton extends StatefulWidget {
  final Icon icon;
  final double size;
  final Function onPressed;
  RoundButton({this.icon, this.size, this.onPressed});
  @override
  _RoundButtonState createState() =>
      _RoundButtonState(icon: icon, size: size, onPressed: onPressed);
}

class _RoundButtonState extends State<RoundButton> {
  Icon icon;
  double size;
  Function onPressed;
  _RoundButtonState({this.icon, this.size, this.onPressed});
  @override
  Widget build(BuildContext context) {
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
}
