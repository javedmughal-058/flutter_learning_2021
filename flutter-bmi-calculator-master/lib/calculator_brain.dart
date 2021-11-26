import 'dart:math';

class CalculatorBrain {
  final int dAmount;
  final int no_service_year;

  int ActualAmount;
  double gpfund;

  CalculatorBrain(
      {this.dAmount,this.no_service_year}
      );

  String calculateBMI() {
    ActualAmount = dAmount*12;
    return ActualAmount.toStringAsFixed(1);
  }

  String getResult() {
    if(no_service_year==1) {
      gpfund = ActualAmount + (ActualAmount * 12 / 100);
      return gpfund.toStringAsFixed(1);
    }
    else if(no_service_year==2) {
      gpfund = (ActualAmount * 2)+((ActualAmount+ActualAmount) * 12 / 100)+(ActualAmount * 12 / 100);
      return gpfund.toStringAsFixed(1);
    }

  }
}
