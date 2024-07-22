import 'package:drift_project/data/local/db/app_db.dart';
import 'package:drift_project/screens/employee/employee_future.dart';
import 'package:drift_project/screens/employee/employee_stream_screen.dart';
import 'package:drift_project/screens/widget/employee_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late AppDb _db;
  final pages = const [
    EmployeeFutureScreen(),
    EmployeeStreamScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _db = AppDb();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add_employee');
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Employee"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          backgroundColor: Colors.blue.shade300,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
          showSelectedLabels: false,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              activeIcon: Icon(Icons.list_outlined),
              label: 'Employee Future',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              activeIcon: Icon(Icons.list_outlined),
              label: 'Employee Stream',
            ),
          ]),
    );
  }
}
