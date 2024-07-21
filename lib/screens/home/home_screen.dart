import 'package:drift_project/data/local/db/app_db.dart';
import 'package:drift_project/screens/widget/employee_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppDb _db;

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
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _db.getEmployees(),
        builder: (context, snapshot) {
          final List<EmployeeEntityData>? employees = snapshot.data;

          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(),
              ),
            );
          }

          if (employees != null) {
            return ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) =>
                  EmployeeCard(employee: employees[index]),
            );
          }
          return const Text("No data found");
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add_employee');
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Employee"),
      ),
    );
  }
}
