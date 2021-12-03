import 'package:flutter/material.dart';

class MissionDetails extends StatefulWidget {
  const MissionDetails({Key key}) : super(key: key);

  @override
  _MissionDetailsState createState() => _MissionDetailsState();
}

class _MissionDetailsState extends State<MissionDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Colors.white,
          ),
          _buildAppBar(),
          _buildContent()
        ],
      ),
    );
  }

  Widget _buildMissionItem({VoidCallback ontap}) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                bottomLeft: Radius.circular(2),
                bottomRight: Radius.circular(2),
              ),
              image: DecorationImage(
                  image: AssetImage('assets/images/paysage.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Container(
              height: 150,
              padding: EdgeInsets.only(bottom: 5),
              // color: Colors.purple,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(2),
                    // bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ISIG Goma',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur adipisicing elit',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: ontap,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          'visualiser',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: 60,
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}





// class MissionDetails extends StatefulWidget {
//   @override
//   _MissionDetailsState createState() => _MissionDetailsState();
// }

// class _MissionDetailsState extends State<MissionDetails> {
//   int _currentStep = 0;
//   StepperType _stepperType = StepperType.vertical;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Stepper Demo"),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Expanded(
//                 child: Stepper(
//               type: _stepperType,
//               currentStep: _currentStep,
//               physics: ScrollPhysics(),
//               onStepTapped: (step) => tapped(step),
//               onStepContinue: continued,
//               onStepCancel: canceled,
//               steps: <Step>[
//                 Step(
//                     title: Text("Hesap İşlemleri"),
//                     content: Column(
//                       children: [
//                         TextFormField(
//                           decoration:
//                               InputDecoration(labelText: 'Eposta Adresi'),
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(labelText: 'Şifre'),
//                         ),
//                       ],
//                     ),
//                     isActive: _currentStep >= 0,
//                     state: _currentStep >= 0
//                         ? StepState.complete
//                         : StepState.disabled),
//                 Step(
//                     title: Text("Adres Bilgileri"),
//                     content: Column(
//                       children: [
//                         TextFormField(
//                           decoration: InputDecoration(labelText: 'Adres'),
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(labelText: 'Posta Kodu'),
//                         ),
//                       ],
//                     ),
//                     isActive: _currentStep >= 0,
//                     state: _currentStep >= 1
//                         ? StepState.complete
//                         : StepState.disabled),
//                 Step(
//                     title: Text("Telefon"),
//                     content: Column(
//                       children: [
//                         TextFormField(
//                           decoration:
//                               InputDecoration(labelText: 'Cep Telefonu'),
//                         ),
//                       ],
//                     ),
//                     isActive: _currentStep >= 0,
//                     state: _currentStep >= 2
//                         ? StepState.complete
//                         : StepState.disabled),
//               ],
//             )),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.list),
//         onPressed: switchStepsType,
//       ),
//     );
//   }

//   tapped(int step) {
//     setState(() {
//       _currentStep = step;
//     });
//   }

//   void continued() {
//     _currentStep < 2 ? setState(() => _currentStep += 1) : null;
//   }

//   void canceled() {
//     _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
//   }

//   void switchStepsType() {
//     setState(() {
//       _stepperType == StepperType.vertical
//           ? _stepperType = StepperType.horizontal
//           : _stepperType = StepperType.vertical;
//     });
//   }
// }
