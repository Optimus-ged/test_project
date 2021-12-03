import 'package:ackaton_manage/ui/screens/mission_page.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  // final Contribuable contribuable;
  const Principal({Key key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int currentTap = 0;
  // GetAllEnterpriseBloc _getAllEnterpriseBloc;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen;

  @override
  void initState() {
    // BlocProvider.of<GetAllEnterpriseBloc>(context)
    //   ..add(LoadEnterprises(userId: widget.contribuable.id));

    // tz.initializeTimeZones();

    currentScreen = MissionPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: 60,
          padding: EdgeInsets.only(top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  // color: Colors.red,
                  // width: MediaQuery.of(context).size.width * .50,
                  child: MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = MissionPage();
                        currentTap = 0;
                      });
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Icon(
                          Icons.home_outlined,
                          color: currentTap == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Accueil',
                          style: TextStyle(
                            color: currentTap == 0 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // width: MediaQuery.of(context).size.width * .50,
                  // color: Colors.green,
                  child: MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = MissionPage();
                        currentTap = 1;
                      });
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Icon(
                          Icons.countertops_outlined,
                          color: currentTap == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Entrepri..',
                          style: TextStyle(
                            color: currentTap == 1 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // width: MediaQuery.of(context).size.width * .50,
                  // color: Colors.red,
                  child: MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = MissionPage();
                        currentTap = 2;
                      });
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Icon(
                          Icons.notifications,
                          color: currentTap == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Notifs',
                          style: TextStyle(
                            color: currentTap == 2 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = MissionPage();
                        currentTap = 3;
                      });
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Icon(
                          Icons.face,
                          color: currentTap == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTap == 3 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
