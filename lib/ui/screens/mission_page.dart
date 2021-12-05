import 'package:ackaton_manage/bloc/mission_bloc/mission_bloc.dart';
import 'package:ackaton_manage/bloc/mission_bloc/mission_state.dart';
import 'package:ackaton_manage/ui/screens/mission_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class MissionPage extends StatefulWidget {
  const MissionPage({Key key}) : super(key: key);

  @override
  _MissionPageState createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  LoadMissionBloc _loadMissionBloc;
  bool isLoading = false;

  @override
  void initState() {
    _loadMissionBloc = BlocProvider.of<LoadMissionBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoadMissionBloc, LoadMissionState>(
        bloc: _loadMissionBloc,
        listener: (context, state) {
          if (state is LoadMissionInProgress) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is LoadMissionSuccess) {
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(
              // msg: "${state.enterpriseData}",
              msg: 'success message',
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.black.withOpacity(0.6),
            );
          }
          if (state is LoadMissionFailure) {}
        },
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildSearch(context),
                _buildItemList(context),
              ],
            ),
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

  Widget _buildMissionItem({VoidCallback ontap}) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
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
                        // fontWeight: FontWeight.bold,
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

  Widget _buildItemList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: !isLoading
          ? Column(
              children: [
                _buildMissionItem(
                  ontap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MissionDetails(),
                    ),
                  ),
                ),
                _buildMissionItem(),
                _buildMissionItem(),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
