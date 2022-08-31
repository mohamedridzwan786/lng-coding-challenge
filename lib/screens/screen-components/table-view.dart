import 'package:flutter/material.dart';
import 'package:lng/screens/screen-components/task-view.dart';
import 'package:lng/screens/screen-components/team-view.dart';


class TableView extends StatefulWidget {
  const TableView({Key? key}) : super(key: key);

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          // bottomSheet: BottomSheet(),
          appBar: AppBar(
            // title: Center(child: Image.asset('assets/images/logo.png', fit: BoxFit.cover)),
            backgroundColor: Colors.white,
            elevation: 0,
            // title: Text('Flutter Tabs Demo'),
            bottom: TabBar(
              indicatorColor: Colors.grey,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "Task View"),
                Tab(text: "Team View"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TaskView(),
              TeamView(),
            ],
          ),
        ),
      ),
    );
  }
}