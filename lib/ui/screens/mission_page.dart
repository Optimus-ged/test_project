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
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          _buildSearch()
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            // decoration: BoxDecoration(color: Colors.purple),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: 'rechercher...'),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Icon(Icons.verified),
          
        )
      ],
    );
  }
}
