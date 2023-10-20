import 'package:bmi_calculator/reuseableCard.dart';
import 'package:flutter/material.dart';
import 'constans.dart';
import 'buttom_button.dart';

class ResultPage extends StatelessWidget {
    ResultPage({this.bmiCalc,this.resultText,this.suggestionText});
  final String bmiCalc;
  final String resultText;
  final String suggestionText;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Caclulator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                child: Text('Your Results', style:kResultBold ,),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReuseableCard(
                  colour: kinActiveButtonColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(resultText.toUpperCase(),style: kResultSuggestion,textAlign: TextAlign.center,),
                      Text(bmiCalc,style: kResultBold,textAlign: TextAlign.center,),
                      Text(suggestionText,style: kResultNormal,textAlign: TextAlign.center,),
                    ],
                  ),
                )
            ),
           BottomButton(onPressed: (){
             Navigator.pop(context);
    },buttonName: 'Re-Calculate',),
                     ],
        )
    );
  }
}
