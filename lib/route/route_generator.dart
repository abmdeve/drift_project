import 'package:drift_project/screens/employee/add_employee_screen.dart';
import 'package:drift_project/screens/employee/edit_employee_screen.dart';
import 'package:drift_project/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/add_employee':
        return MaterialPageRoute(builder: (_) => const AddEmployeeScreen());
      case '/edit_employee':
        if (args is int) {
          return MaterialPageRoute(
              builder: (_) => EditEmployeeScreen(
                    id: args,
                  ));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("No Route"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            "Sorry no route was found",
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ),
      );
    });
  }
}
