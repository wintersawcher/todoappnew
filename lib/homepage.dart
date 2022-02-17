import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/taskall.dart';
import 'package:flutter_application_1/model/todomodel.dart';
import 'package:flutter_application_1/widget/taskin.dart';
import 'package:flutter_application_1/widget/tasksuccess.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  late TabController _tabController;
  int _tabIndex = 0;
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _tabIndex = _tabController.index;
      });
    }
  }

  final TextEditingController _themtask = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Widget> _tab = [TaskSucess(), TaskAlls(), const TaskIn()];
    return Scaffold(
      body: IndexedStack(
        children: _tab,
        index: selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("Complete")),
          BottomNavigationBarItem(
              icon: Icon(Icons.all_inbox), title: Text("All")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("Incomplete")),
        ],
        onTap: (int index) {
          this.onTapHandler(index);
        },
      ),
    );
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
