import 'package:ackaton_manage/models/mission/mission_response.dart';
import 'package:ackaton_manage/ui/widgets/build_widget.dart';
import 'package:flutter/material.dart';
import 'add_task_page.dart';

class TasksPage extends StatefulWidget {
  // final Data mission;
  final List<String> allTasks;
  const TasksPage({@required this.allTasks, Key key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Widget> _taskLists = [];
  void _loadTasks() {
    if (widget.allTasks.length != 0) {
      widget.allTasks.forEach(
        (e) {
          _taskLists.add(BuildTaskItem(title: e));
        },
      );
    }
  }

  @override
  void initState() {
    _loadTasks();
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              tooltip: 'Ajouter une tache}',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddTaskPage(),
                ),
              ),
              child: Icon(
                Icons.add_chart,
              ),
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
          Text('Tâches')
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _taskLists.length != 0
                  ? Container(
                      width: MediaQuery.of(context).size.width - 40,
                      // color: Colors.amber,
                      padding: EdgeInsets.only(bottom: 20, top: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _taskLists,
                        ),
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.remove_shopping_cart_outlined,
                            color: Colors.blue[50],
                            size: 100,
                          ),
                          Text(
                            "aucune tache\ndiponible",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue[50],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            // _buildButton(context),
          ],
        ),
      ),
    );
  }

  // Widget _buildTaskItem({String title}) {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 5),
  //     width: 300,
  //     decoration: BoxDecoration(
  //         color: Colors.blue[50], borderRadius: BorderRadius.circular(2)),
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 20,
  //     ),
  //     child: Text('$title'),
  //   );
  // }
}
