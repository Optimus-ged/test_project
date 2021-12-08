import 'package:ackaton_manage/bloc/process_bloc/load_process.dart/load_process_bloc.dart';
import 'package:ackaton_manage/bloc/process_bloc/load_process.dart/load_process_events.dart';
import 'package:ackaton_manage/bloc/process_bloc/load_process.dart/load_process_state.dart';
import 'package:ackaton_manage/ui/widgets/create_process_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProcess extends StatefulWidget {
  const AddProcess({Key key}) : super(key: key);

  @override
  _AddProcessState createState() => _AddProcessState();
}

class _AddProcessState extends State<AddProcess> {
  LoadProcessBloc _loadProcessBloc;

  @override
  void initState() {
    _loadProcessBloc = BlocProvider.of<LoadProcessBloc>(context);
    super.initState();
  }

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
          Text('Ajouter un processus')
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
        child: BlocBuilder<LoadProcessBloc, LoadProcessState>(
          bloc: _loadProcessBloc,
          builder: (context, state) {
            if (state is LoadProcessInProgress) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
            if (state is LoadProcessSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: EdgeInsets.only(bottom: 20, top: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: state.procResp.data
                              .map(
                                (e) => _buildItem(
                                  context,
                                  title: '${e.description}',
                                  number: '22',
                                  onTap: () {},
                                ),
                              )
                              .toList(),
                          // children: [

                          //   _buildItem(
                          //     context,
                          //     title: 'qqq',
                          //     number: '22',
                          //     onTap: () {},
                          //   ),
                          //   _buildItem(
                          //     context,
                          //     title: 'qqq',
                          //     number: '22',
                          //     onTap: () {},
                          //   ),
                          //   _buildItem(
                          //     context,
                          //     title: 'qqq',
                          //     number: '22',
                          //     onTap: () {},
                          //   ),
                          // ],
                        ),
                      ),
                    ),
                  ),
                  BuildButton(),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context,
      {String title, number, VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                    // fontSize: 12,
                    ),
              ),
            ),
            Container(
              child: Text(
                '$number',
                style: TextStyle(
                  // fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
