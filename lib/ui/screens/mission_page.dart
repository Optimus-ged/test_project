import 'package:flutter/material.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSearch(context),
              _buildItemList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearch(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(2)),
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.search,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                              hintText: 'rechercher...'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.blue,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
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
                        color: Colors.black54,
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
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        'visualiser',
                        style: TextStyle(fontSize: 12, color: Colors.white),
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

  Widget _buildItemList() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          _buildMissionItem(),
          _buildMissionItem(),
          _buildMissionItem(),
          // _buildMissionItem(),
          // _buildMissionItem(),
          // _buildMissionItem(),
          // _buildMissionItem(),
          // _buildMissionItem(),
          // _buildMissionItem(),
        ],
      ),
    );
  }
}
