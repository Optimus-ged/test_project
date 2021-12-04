import 'package:flutter/material.dart';

class BuildStepper extends StatefulWidget {
  const BuildStepper({ Key key }) : super(key: key);

  @override
  _BuildStepperState createState() => _BuildStepperState();
}

class _BuildStepperState extends State<BuildStepper> {
  int _currentStep = 0;
  StepperType _stepperType = StepperType.vertical;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stepper(
            type: _stepperType,
            currentStep: _currentStep,
            physics: ScrollPhysics(),
            onStepTapped: (step) => tapped(step),
            onStepContinue: continued,
            onStepCancel: canceled,
            steps: <Step>[
              Step(
                title: Text(
                  "Preparation",
                  style: TextStyle(fontSize: 12),
                ),
                content: Text(
                  'Le projet est en cours de preparation',
                  style: TextStyle(fontSize: 12),
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text(
                  "Execution",
                  style: TextStyle(fontSize: 12),
                ),
                content: Text(
                  'Le projet est en cours d\execution',
                  style: TextStyle(fontSize: 12),
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text(
                  "Netoyage",
                  style: TextStyle(fontSize: 12),
                ),
                content: Text(
                  'Le projet est en cours de netoyage',
                  style: TextStyle(fontSize: 12),
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text(
                  "Analyse",
                  style: TextStyle(fontSize: 12),
                ),
                content: Text(
                  'Le projet est en cours d\'analyse',
                  style: TextStyle(fontSize: 12),
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text(
                  "Rapport",
                  style: TextStyle(fontSize: 12),
                ),
                content: Text(
                  'Rapport en cours d\'edition',
                  style: TextStyle(fontSize: 12),
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text(
                  "Presentation",
                  style: TextStyle(fontSize: 12),
                ),
                content: Text(
                  'Presentation en cours',
                  style: TextStyle(fontSize: 12),
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
            ],
          ),
        ],
      ),
    );
  }

  
  tapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  void continued() {
    if (_currentStep < 2) setState(() => _currentStep += 1);
  }

  void canceled() {
    if (_currentStep > 0) setState(() => _currentStep -= 1);
  }

}