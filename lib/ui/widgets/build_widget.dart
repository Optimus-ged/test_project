import 'package:flutter/material.dart';

class BuildTaskItem  extends StatelessWidget {
  final String title;
  const BuildTaskItem ({ Key key , @override this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          color: Colors.blue[50], borderRadius: BorderRadius.circular(2)),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Text('$title'),
    );
  }
}