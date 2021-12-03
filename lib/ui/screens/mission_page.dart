import 'package:flutter/material.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: SizedBox(
      //     height: 80,
      //     width: 80,
      //     child: ElevatedButton(
      //       onPressed: () => Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (context) => MissionProcess(),
      //         ),
      //       ),
      //       style:
      //           ButtonStyle(shape: MaterialStateProperty.all(CircleBorder())),
      //       child: Text('click'),
      //     ),
      //   ),
      // ),
      body: Column(
        children: [_buildSearch(context), _buildItemList()],
      ),
    );
  }

  Widget _buildSearch(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              // decoration: BoxDecoration(color: Colors.purple),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: 'rechercher...'),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Icon(Icons.verified),
          )
        ],
      ),
    );
  }

  Widget _buildMissionItem() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(color: Colors.amber),
          ),
          Expanded(
            child: Container(
              height: 150,
              padding: EdgeInsets.only(bottom: 10),
              // color: Colors.purple,
              child: Container(
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemList() {
    return Column(
      children: [
        _buildMissionItem(),
        _buildMissionItem(),
        _buildMissionItem(),
      ],
    );
  }
}
