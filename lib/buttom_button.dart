import 'package:flutter/material.dart';
import 'constans.dart';

class BottomButton extends StatelessWidget {
  final Function onPressed;
  final String buttonName;
  BottomButton({@required this.onPressed,@required this.buttonName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 55,
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(top: 10),
        color: kfooterColor,
        child: Text(buttonName,
          style: kboldText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
