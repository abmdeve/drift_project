import 'package:drift_project/data/local/db/app_db.dart';
import 'package:drift_project/screens/widget/employee_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeFutureScreen extends StatefulWidget {
  const EmployeeFutureScreen({super.key});

  @override
  State<EmployeeFutureScreen> createState() => _EmployeeFutureScreenState();
}

class _EmployeeFutureScreenState extends State<EmployeeFutureScreen> {
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
        title: const Text("Employee Future"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<EmployeeEntityData>>(
        future: Provider.of<AppDb>(context).getEmployees(),
        //future: _db.getEmployees(),
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
              itemBuilder: (context, index) => EmployeeCard(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/edit_employee',
                    arguments: employees[index].id,
                  );
                },
                employee: employees[index],
              ),
            );
          }
          return const Text("No data found");
        },
      ),
    );
  }
}