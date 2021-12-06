import 'package:ackaton_manage/bloc/mission_bloc/mission_bloc.dart';
import 'package:ackaton_manage/bloc/mission_bloc/mission_state.dart';
import 'package:ackaton_manage/models/mission/mission_response.dart';
import 'package:ackaton_manage/ui/widgets/hero_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_participant_page.dart';

class ParticipantPage extends StatefulWidget {
  final Data mission;
  const ParticipantPage({@required this.mission, Key key}) : super(key: key);

  @override
  _ParticipantPageState createState() => _ParticipantPageState();
}

class _ParticipantPageState extends State<ParticipantPage> {
  LoadMissionBloc _loadMissionBloc;
  List<Widget> _participantWidgetList = [];

  @override
  void initState() {
    _loadMissionBloc = BlocProvider.of<LoadMissionBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
              child: Icon(Icons.group_add),
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
    return BlocBuilder<LoadMissionBloc, LoadMissionState>(
      bloc: _loadMissionBloc,
      builder: (context, state) {
        if (state is LoadMissionSuccess) {
          // Traitments
          widget.mission.members.forEach((e) {
            _participantWidgetList.add(
              _participantItem(
                e,
                MediaQuery.of(context).size,
              ),
            );
          });

          // Building the Ui
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
                          children: _participantWidgetList,
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
        return Container();
      },
    );
  }

  Widget _participantItem(Members participant, Size screenSize) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        new HeroDialogRoute(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(
                left: screenSize.width * .15,
                right: screenSize.width * .15,
                bottom: screenSize.height * .20,
              ),
              child: AlertDialog(
                backgroundColor: Colors.transparent,
                actionsPadding: EdgeInsets.all(0),
                buttonPadding: EdgeInsets.all(0),
                insetPadding: EdgeInsets.all(0),
                elevation: 0,
                titlePadding: EdgeInsets.all(0),
                contentPadding: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                content: Builder(
                  builder: (context) => Hero(
                    tag: '${participant.memberId}',
                    child: new Container(
                      height: 300.0,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        // image: DecorationImage(
                        //   image: AssetImage(
                        //     '$photo',
                        //   ),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              color: Colors.black.withOpacity(0.3),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 7),
                                child: Text(
                                  'eee',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black54,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.message,
                                          color: Colors.white70,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Message',
                                          style: TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      child: Container(
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
              Text('${participant.memberName}', style: TextStyle(fontSize: 14)),
              Text(
                '${participant.telephone}',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
