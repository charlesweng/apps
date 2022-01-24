class BMI {
  final int weight;
  final int height;
  double _bmi;

  BMI({this.weight, this.height});
  
  // https://www.cdc.gov/nccdphp/dnpao/growthcharts/training/bmiage/page5_1.html
  void calculate() {
    _bmi = weight / height / height * 10000;
    _bmi = (_bmi * 10.0).round() / 10.0;
  }

  get getBmi => _bmi;
  
  String getStatus() {
    if (_bmi < 18.5) {
      return "Underweight";
    } else if (18.5 <= _bmi && _bmi <= 24.9) {
      return "Normal";
    } else if (24.9 < _bmi && _bmi <= 29.9) {
      return "Overweight";
    } else if (_bmi > 29.9) {
      return "Obese";
    } else {
      return "Unknown";
    }
  }

  String getAction() {
    if (_bmi < 18.5) {
      return "Eat more.";
    } else if (18.5 <= _bmi && _bmi <= 24.9) {
      return "You don't need to do anything.";
    } else if (24.9 < _bmi && _bmi <= 29.9) {
      return "Exercise more.";
    } else if (_bmi > 29.9) {
      return "See a nutritionist.";
    } else {
      return "Unknown";
    }
  }
}