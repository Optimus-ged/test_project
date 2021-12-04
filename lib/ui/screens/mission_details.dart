import 'package:ackaton_manage/constants/theme.dart';
import 'package:ackaton_manage/ui/screens/participant_page.dart';
import 'package:ackaton_manage/ui/widgets/stepper_widget.dart';
import 'package:flutter/material.dart';

import 'add_participant_page.dart';
import 'tasks_page.dart';

class MissionDetails extends StatefulWidget {
  const MissionDetails({Key key}) : super(key: key);

  @override
  _MissionDetailsState createState() => _MissionDetailsState();
}

class _MissionDetailsState extends State<MissionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[50],
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
              color: Colors.white,
            ),
            _buildAppBar(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionItem() {
    return Container(
      // margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
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
                fit: BoxFit.cover,
              ),
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
      padding: EdgeInsets.only(left: 5),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: EdgeInsets.all(10),
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(180 / 360),
                child: Icon(Icons.arrow_right_alt),
              ),
            ),
          ),
          Text('Details'),
           Spacer(),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ParticipantPage(),
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.people_rounded, size: 18),
                  Text('Participants'),
                ],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TasksPage(),
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.topic_rounded, size: 18),
                  Text('Tâches'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.red,
              height: MediaQuery.of(context).size.height - 84,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      _buildMissionItem(),
                      SizedBox(height: 20),
                      Text(
                        'A propos',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                          text:
                              'Lorem ipsum dolor sit amet consectetur adipisicing elit Iure nihil magnam accusamus, iusto inventore molestias ipsum dolor sit amet consectetur adipisicing elit. Iurenihil magnam accusamus, iusto inventore molestias cette mission va va du',
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: '${CustomTheme.secondaryFont}',
                              color: Colors.black),
                          children: const <TextSpan>[
                            TextSpan(
                              text: ' 01/01/2021',
                              style: TextStyle(
                                color: Colors.green,
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(text: ' au'),
                            TextSpan(
                              text: ' 01/01/2022',
                              style: TextStyle(
                                // fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildItem(title: 'Nombre de jour', number: '365'),
                      _buildItem(title: 'Nombre des taches', number: '20'),
                      _buildItem(title: 'Nombre d\'intervenants', number: 5),
                      BuildStepper(),
                    ],
                  ),
                ),
              ),
            ),
            // Spacer(),
            // _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({String title, number}) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(
          left: BorderSide(width: 4, color: Colors.blue[50]),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              '$title',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          Container(
            child: Text(
              '$number',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      alignment: Alignment.bottomCenter,
      child: Material(
        elevation: 4,
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // color: CustomTheme.redColor,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            // onTap: () => _loginBtnPressed(),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddParticipant(),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  'Ajouter un participant',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
