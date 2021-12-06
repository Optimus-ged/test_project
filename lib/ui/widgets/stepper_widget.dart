import 'package:flutter/material.dart';

class BuildStepper extends StatefulWidget {
  final int level;
  const BuildStepper({Key key, this.level}) : super(key: key);

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
        SizedBox(height: 10),
        Container(
          child: Column(
            children: [
              _buildStepperItem(closed: false, title: 'Préparation ', state: 3),
              _buildStepperItem(closed: false, title: 'Exécution', state: 3),
              _buildStepperItem(closed: false, title: 'Nettoyage', state: 3),
              _buildStepperItem(closed: true, title: 'Analyse', state: 1),
              _buildStepperItem(closed: true, title: 'Rapport', state: 1),
              _buildStepperItem(closed: true, title: 'Presentation', state: 1),
            ],
          ),
        ),
      ],
    );
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

  Widget _buildStepperItem(
      {@required bool closed, @required String title, @required int state}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[50], borderRadius: BorderRadius.circular(2)),
      padding: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.verified,
            color: closed ? Colors.red : Colors.blue,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.green,
                    height: 25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          state == 1
                              ? '$title fermée'
                              : state == 2
                                  ? '$title en cours'
                                  : '$title terminée ',
                          style: TextStyle(
                            fontSize: 12,
                            color: closed ? Colors.red : Colors.blue,
                          ),
                        ),
                        if (state != 3)
                          Container(
                            decoration: BoxDecoration(
                              color: closed ? Colors.red : Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                              // border: Border.all(
                              //   width: 1,
                              //   color: Colors.red,
                              //   style: BorderStyle.solid
                              // )
                            ),
                            padding: EdgeInsets.all(4),
                            child: Text(
                              closed ? 'Ouvrir' : 'Fermé ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  if (state == 2 || state == 3)
                    Container(
                      // height: 50,
                      child: Column(
                        children: [
                          _buildParticipant(),
                          _buildParticipant(),
                        ],
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildParticipant() {
    return ListTile(
      minVerticalPadding: 10,
      horizontalTitleGap: 10,
      contentPadding: EdgeInsets.only(bottom: 10),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.blue[50],
        backgroundImage: AssetImage('assets/images/person.jpg'),
        // child: Icon(Icons.person),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Optimus Ged', style: TextStyle(fontSize: 14)),
          Text(
            'Coordonateur directe',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}








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
    // ))