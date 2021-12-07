import 'package:ackaton_manage/bloc/mission_bloc/mission_bloc.dart';
import 'package:ackaton_manage/bloc/mission_bloc/mission_state.dart';
import 'package:ackaton_manage/constants/theme.dart';
import 'package:ackaton_manage/models/mission/mission_response.dart';
import 'package:ackaton_manage/ui/widgets/custom_rect_tween.dart';
import 'package:ackaton_manage/ui/widgets/hero_dialog.dart';
import 'package:ackaton_manage/ui/widgets/participant_widget.dart';
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
    // Size screenSize = MediaQuery.of(context).size;
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
          _participantWidgetList.clear();
          widget.mission.members.forEach((e) {
            _participantWidgetList.add(
              _participantItem(e, MediaQuery.of(context).size),
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
                  // Text('${widget.mission.members.length}'),
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
        HeroDialogRoute(
          builder: (BuildContext context) {
            return ParticipantDialog(
              participant: participant,
            );

            // child: ;
          },
        ),
      ),
      child: Container(
        // color: Colors.green,
        child: ListTile(
          minVerticalPadding: 10,
          horizontalTitleGap: 10,
          contentPadding: EdgeInsets.only(bottom: 10),
          leading: Hero(
            tag: '${participant.memberId}',
            createRectTween: (begin, end) => CustomRectTween(
              begin: begin,
              end: end,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(0.2),
                child: CircleAvatar(
                  foregroundColor: Colors.blue[50],
                  radius: 30,
                  backgroundColor: Colors.blue[50],
                  backgroundImage: AssetImage('assets/images/noAvatar.png'),
                ),
              ),
            ),
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

  TextStyle titleStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87);
  }

  TextStyle contentStyle() {
    return TextStyle(fontSize: 13, color: Colors.black87);
  }
}
