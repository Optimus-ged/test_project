import 'package:ackaton_manage/models/mission/mission_response.dart';
import 'package:flutter/material.dart';

import 'custom_rect_tween.dart';
import 'hero_dialog.dart';

class ParticipantDialog extends StatelessWidget {
  final Members participant;
  const ParticipantDialog({
    @required this.participant,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
            createRectTween: (begin, end) => CustomRectTween(
              begin: begin,
              end: end,
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Center(
                    child: Container(
                      height: 370,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [Colors.blue[300], Colors.blue[50]],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 25,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 7,
                                      offset: Offset(0, 4))
                                ]),
                            child: Text(
                              'participant',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey[50],
                              backgroundImage:
                                  AssetImage('assets/images/noAvatar.png'),
                            ),
                          ),
                          ConstrainedView(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 0),
                              padding: EdgeInsets.only(left: 30, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Nom :  ', style: titleStyle()),
                                      SizedBox(
                                        // width: 178,
                                        child: Text(
                                          '${participant.memberName}',
                                          style: contentStyle(),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('T??l??phone :  ',
                                          style: titleStyle()),
                                      Text(
                                        '${participant.telephone}',
                                        style: contentStyle(),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Email :  ', style: titleStyle()),
                                      SizedBox(
                                        // width: 150,
                                        child: Text(
                                          '${participant.email}',
                                          style: contentStyle(),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Taches :',
                                          style: titleStyle(),
                                        ),
                                        SingleChildScrollView(
                                          child: Column(
                                            children: participant.memberTask
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Icon(
                                                            Icons.topic_rounded,
                                                            size: 13,
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text(
                                                            '${e.projectTaskName}',
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                                .toList(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle titleStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
      color: Colors.black87,
    );
  }

  TextStyle contentStyle() {
    return TextStyle(fontSize: 13, color: Colors.black87);
  }
}
