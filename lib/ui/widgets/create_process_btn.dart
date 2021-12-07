import 'package:ackaton_manage/bloc/process_bloc/process_bloc.dart';
import 'package:ackaton_manage/bloc/process_bloc/process_event.dart';
import 'package:ackaton_manage/models/process/process_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildButton extends StatefulWidget {
  const BuildButton({Key key}) : super(key: key);

  @override
  _BuildButtonState createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  CreateProcessBloc _createProcessBloc;

  @override
  void initState() {
    _createProcessBloc = BlocProvider.of<CreateProcessBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 0, left: 20, right: 20),
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
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: () => _createProcess(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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

  void _createProcess() {
    _createProcessBloc.add(
      CreateProcessButtonPressed(
        submitData: CreateProcessSubmit(),
      ),
    );
  }
}
