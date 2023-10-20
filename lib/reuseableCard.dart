import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {

  final Color colour;
  final Widget cardChild;
  final Function onPress;
  ReuseableCard({@required this.colour,this.cardChild,this.onPress});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(2),
        child: cardChild,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colour,
        ),
        margin: EdgeInsets.all(3),
      ),
    );
  }
}
