import 'package:drift_project/data/local/db/app_db.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeEntityData employee;
  final VoidCallback onTap;

  const EmployeeCard({super.key, required this.employee, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        //color: Colors.grey.shade400,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.green,
            style: BorderStyle.solid,
            width: 1.2,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(employee.id.toString()),
              Text(
                employee.userName,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                employee.firstName,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                employee.lastName,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                employee.dateOfBirth.toString(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
