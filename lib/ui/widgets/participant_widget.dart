import 'package:flutter/material.dart';

class ParticipantDialog extends StatelessWidget {
  const ParticipantDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 370,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(0xffB90913),
              Color(0xff800323),
            ],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  // '$heureDepart',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                // child: CircleAvatar(
                //   radius: 50,
                //   backgroundColor: Colors.transparent,
                //   backgroundImage: MemoryImage(
                //     base64Decode(widget.agents.photo),
                //   ),
                // ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue[50],
                  backgroundImage: AssetImage('assets/images/person.jpg'),
                  // child: Icon(Icons.person),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 30, top: 20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nom :  ', style: titleStyle()),
                          SizedBox(
                            width: 178,
                            child: Text(
                              'name goes here',
                              style: contentStyle(),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('Téléphone :  ', style: titleStyle()),
                          Text(
                            'telephone',
                            style: contentStyle(),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email :  ', style: titleStyle()),
                          SizedBox(
                            width: 150,
                            child: Text(
                              'mail',
                              style: contentStyle(),
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Id Agent :  ', style: titleStyle()),
                          SizedBox(
                            width: 150,
                            child: Text(
                              'id',
                              style: contentStyle(),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Genre : ',
                            style: titleStyle(),
                          ),
                         Text(
                            'Homme',
                            style: contentStyle(),
                          )
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Text('Arrivé (e) à :  ', style: titleStyle()),
                      //     heureArrive == 'null' || heureArrive == '-'
                      //         ? Text('$heureTempArriv', style: contentStyle())
                      //         : Text('$heureArrive', style: contentStyle())
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Text('Parti (e) à :  ', style: titleStyle()),
                      //     heureDepart == null || heureDepart == '-'
                      //         ? Text('$heureTempDep', style: contentStyle())
                      //         : Text('$heureDepart', style: contentStyle())
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 20),
              // Container(
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius:
              //           BorderRadius.vertical(bottom: Radius.circular(10))),
              //   height: 50,
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child:  Container(
              //             alignment: Alignment.center,
              //             height: 50,
              //             child: Text(
              //               'Ok',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 17,
              //                 color: Colors.green,
              //               ),
              //             ),
              //           ),
                      
              //       ),
                   
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle titleStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13,
        color: Colors.white.withOpacity(0.9));
  }

  TextStyle contentStyle() {
    return TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.9));
  }
}
