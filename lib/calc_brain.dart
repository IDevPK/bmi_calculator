import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});

  final height;
  final weight;
 double _bmi;
  //BMI = mass(kg)/height(sm)

String calculateBMI()
{
  _bmi = weight/pow(height/100,2);
  return _bmi.toStringAsFixed(1);
}
String getResult()
{
  if(_bmi>=25)
    {

  return 'OverWeight';
    }
  else if(_bmi>18.5)
    {
      return 'Normal';
    }
  else{
    return 'Underweight';
  }
}
String getInterpretation(){
  if(_bmi>=25)
  {
    double  weightS = 25*pow(height/100,2);
    weightS = weight - weightS;
    String weightSugestion = weightS.toStringAsFixed(3);
    if(_bmi>30)
      {
        return 'You have $weightSugestion kg excess weight than Max. Normal Body weight. This is too much. You Must Exercise Daily';
      }
   else{
      return 'You have $weightSugestion kg excess weight than Max. Normal Body weight.Try to Exercise Daily';

    }

  }
  else if(_bmi>18.5)
  {

    return 'You have a normal body weight. Good Job!';
  }
  else{
    double  weightS = 18.5*pow(height/100,2);
    weightS = weightS - weight;
    String weightSugestion = weightS.toStringAsFixed(3);
    return 'You have $weightSugestion kg lowe then Minimum Normal body weight. You can eat bit more';
  }
}
}