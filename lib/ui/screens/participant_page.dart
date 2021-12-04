import 'package:flutter/material.dart';

import 'add_participant_page.dart';
import 'add_task_page.dart';

class ParticipantPage extends StatefulWidget {
  const ParticipantPage({Key key}) : super(key: key);

  @override
  _ParticipantPageState createState() => _ParticipantPageState();
}

class _ParticipantPageState extends State<ParticipantPage> {
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
            _buildAppBar(context),
            _buildContent(context)
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              tooltip: 'Ajouter un participant',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddParticipant(),
                ),
              ),
              child: Icon(
                Icons.group_add,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
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
          Text('Participants')
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                // color: Colors.amber,
                padding: EdgeInsets.only(bottom: 20, top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _participantItem(),
                      _participantItem(),
                      _participantItem(),
                      _participantItem(),
                      _participantItem(),
                      _participantItem(),
                    ],
                  ),
                ),
              ),
            ),
            // _buildButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(bottom: 0, left: 20, right: 20),
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
            // onTap: () => Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => AddParticipant(),
            //   ),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.save, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  'Enregistrer',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _participantItem() {
    return Container(
      // color: Colors.green,
      child: ListTile(
        minVerticalPadding: 10,
        horizontalTitleGap: 10,
        contentPadding: EdgeInsets.only(bottom: 10),
        leading: CircleAvatar(
          radius: 30,
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
      ),
    );
  }
}
