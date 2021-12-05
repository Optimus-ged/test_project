import 'package:flutter/material.dart';

class BuildStepper extends StatefulWidget {
  const BuildStepper({Key key}) : super(key: key);

  @override
  _BuildStepperState createState() => _BuildStepperState();
}

class _BuildStepperState extends State<BuildStepper> {
  int _currentStep = 0;
  StepperType _stepperType = StepperType.vertical;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Evolution du projet',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Preparation',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    'Fermée',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
    // return Container(
    //   child: Column(
    //     children: [
    //       Stepper(
    //         type: _stepperType,
    //         currentStep: _currentStep,
    //         physics: ScrollPhysics(),
    //         onStepTapped: (step) => tapped(step),
    //         onStepContinue: continued,
    //         onStepCancel: canceled,
    //         steps: <Step>[
    //           Step(
    //             title: Text(
    //               "Preparation",
    //               style: TextStyle(fontSize: 12),
    //             ),
    //             content: Text(
    //               'Le projet est en cours de preparation',
    //               style: TextStyle(fontSize: 12),
    //             ),
    //             isActive: _currentStep >= 0,
    //             state:
    //                 _currentStep >= 0 ? StepState.complete : StepState.disabled,
    //           ),
    //           Step(
    //             title: Text(
    //               "Execution",
    //               style: TextStyle(fontSize: 12),
    //             ),
    //             content: Text(
    //               'Le projet est en cours d\execution',
    //               style: TextStyle(fontSize: 12),
    //             ),
    //             isActive: _currentStep >= 0,
    //             state:
    //                 _currentStep >= 1 ? StepState.complete : StepState.disabled,
    //           ),
    //           Step(
    //             title: Text(
    //               "Netoyage",
    //               style: TextStyle(fontSize: 12),
    //             ),
    //             content: Text(
    //               'Le projet est en cours de netoyage',
    //               style: TextStyle(fontSize: 12),
    //             ),
    //             isActive: _currentStep >= 0,
    //             state:
    //                 _currentStep >= 2 ? StepState.complete : StepState.disabled,
    //           ),
    //           Step(
    //             title: Text(
    //               "Analyse",
    //               style: TextStyle(fontSize: 12),
    //             ),
    //             content: Text(
    //               'Le projet est en cours d\'analyse',
    //               style: TextStyle(fontSize: 12),
    //             ),
    //             isActive: _currentStep >= 0,
    //             state:
    //                 _currentStep >= 3 ? StepState.complete : StepState.disabled,
    //           ),
    //           Step(
    //             title: Text(
    //               "Rapport",
    //               style: TextStyle(fontSize: 12),
    //             ),
    //             content: Text(
    //               'Rapport en cours d\'edition',
    //               style: TextStyle(fontSize: 12),
    //             ),
    //             isActive: _currentStep >= 0,
    //             state:
    //                 _currentStep >= 4 ? StepState.complete : StepState.disabled,
    //           ),
    //           Step(
    //             title: Text(
    //               "Presentation",
    //               style: TextStyle(fontSize: 12),
    //             ),
    //             content: Text(
    //               'Presentation en cours',
    //               style: TextStyle(fontSize: 12),
    //             ),
    //             isActive: _currentStep >= 0,
    //             state:
    //                 _currentStep >= 5 ? StepState.complete : StepState.disabled,
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );

    // return Container(
    //     child: Stepper(
    //   steps: [
    //     Step(
    //         title: Text("Task-1"),
    //         content: Text(""),
    //         subtitle: Text("Compled"),
    //         isActive: true,
    //         state: StepState.complete),
    //     Step(
    //         title: Text("Task-2"),
    //         content: Text(""),
    //         subtitle: Text("Compled"),
    //         isActive: true,
    //         state: StepState.complete),
    //     Step(
    //         title: Text("Task-3"),
    //         content: Text(""),
    //         subtitle: Text("Compled"),
    //         isActive: true,
    //         state: StepState.disabled),
    //     Step(
    //         title: Text("Task-4"),
    //         content: Text(""),
    //         subtitle: Text("Compled"),
    //         isActive: true,
    //         state: StepState.editing),
    //     Step(
    //         title: Text("Task-5"),
    //         content: Text(""),
    //         subtitle: Text("Compled"),
    //         isActive: true,
    //         state: StepState.error),
    //     Step(
    //         title: Text("Task-6"),
    //         content: Text(""),
    //         subtitle: Text("Compled"),
    //         isActive: true,
    //         state: StepState.complete),
    //     Step(
    //         title: Text("Task-7"),
    //         content: Text(""),
    //         subtitle: Text("Compled"),
    //         isActive: true,
    //         state: StepState.complete),
    //   ],
    //   currentStep: _index,
    //   onStepTapped: (index) {
    //     setState(() {
    //       _index = index;
    //     });
    //   },
    //   controlsBuilder: (BuildContext context,
    //           {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
    //       Container(),
    // ));
  }

  tapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  void continued() {
    if (_currentStep < 5) setState(() => _currentStep += 1);
  }

  void canceled() {
    if (_currentStep > 0) setState(() => _currentStep -= 1);
  }
}
