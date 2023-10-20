import 'package:flutter/material.dart';


class IconDetails extends StatelessWidget {
  final IconData icon;
  final String genderLabel;
  final Color iconColor;
  IconDetails({this.icon,this.genderLabel,this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon,size: 80,color: iconColor,),
        SizedBox(height: 10,),
        Text(genderLabel,style: TextStyle(fontSize: 20,color: iconColor),)
      ],
    );
  }
}

class RoundedButton extends RawMaterialButton{
  RoundedButton();


}
