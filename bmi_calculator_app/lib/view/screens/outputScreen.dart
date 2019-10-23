import 'package:bmi_calculator_app/constants/colorCodes.dart';
import 'package:bmi_calculator_app/constants/dimentions.dart';
import 'package:bmi_calculator_app/tasks/calculationTask.dart';
import 'package:bmi_calculator_app/view/customWidgets/homeScreenCards.dart';
import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget
{

  final double weight, height;
  BMICalculationTask _bmiCalculationTask;
  BMIResult({this.weight,this.height})
  {
    _bmiCalculationTask = BMICalculationTask(height: height, weight: weight);
  }


  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculation Result",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: InputCard(
                color: Color(CARD_BACKGROUND_COLOR),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          _bmiCalculationTask.getResult(),
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        _bmiCalculationTask.calculateBMI(),
                        style: TextStyle(
                            fontSize: 75.0,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Normal BMI range:",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            "18, 5 - 25 kg/m2",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          _bmiCalculationTask.getMessage(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],

                ),

              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                color: Color(CALCULATE_BUTTON_COLOR),
                height: CALCULATE_BUTTON_HEIGHT,
                margin: EdgeInsets.only(top: 24.0),
                child: Center(
                  child: Text(
                    "RE-CALCULATE YOUR BMI",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );;
  }

}
