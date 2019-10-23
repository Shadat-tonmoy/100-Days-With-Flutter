import 'dart:math';

import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/constants/strings.dart';

class BMICalculationTask
{
  final int height;
  final int weight;

  BMICalculationTask({this.height,this.weight});

  double _bmi;

  String calculateBMI()
  {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult()
  {
    if(_bmi >= OVERWEIGHT_BMI_THRESHOLD)
    {
      return OVERWEIGHT;
    }
    else if(_bmi > NORMAL_BMI_THRESHOLD)
    {
      return NORMAL;
    }
    else return UNDERWEIGHT;
  }

  String getMessage()
  {
    if(_bmi >= OVERWEIGHT_BMI_THRESHOLD)
    {
      return OVERWEIGHT_BMI_MESSAGE;
    }
    else if(_bmi > NORMAL_BMI_THRESHOLD)
    {
      return NORMAL_BMI_MESSAGE;
    }
    else return UNDERWEIGHT_BMI_MESSAGE;
  }

}