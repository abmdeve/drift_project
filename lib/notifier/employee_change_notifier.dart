import 'package:drift_project/data/local/db/app_db.dart';
import 'package:flutter/material.dart';

class EmployeeChangeNotifier extends ChangeNotifier {
  AppDb? _appDb;

  void initAppDb(AppDb db) {
    _appDb = db;
  }

  List<EmployeeEntityData> _employeeListFuture = [];

  List<EmployeeEntityData> get employeeListFuture => _employeeListFuture;
  List<EmployeeEntityData> _employeeListStream = [];

  List<EmployeeEntityData> get employeeListStream => _employeeListStream;
  EmployeeEntityData? _employeeEntityData;

  EmployeeEntityData? get employeeEntityData => _employeeEntityData;

  String _error = '';

  String get error => _error;
  bool _isAdded = false;

  bool get isAdded => _isAdded;
  bool _isUpdated = false;

  bool get isUpdated => _isUpdated;
  bool _isDeleted = false;

  bool get isDeleted => _isDeleted;

  void getEmployeeFuture() {
    _appDb?.getEmployees().then((value) {
      _employeeListFuture = value;
    }).onError((error, stackStrace) {
      _error = error.toString();
    });

    notifyListeners();
  }

  void getEmployeeStream() {
    _appDb?.getEmployeeStream().listen((event) {
      _employeeListStream = event;
    });

    notifyListeners();
  }

  void getSingleEmployee(int id) {
    _appDb?.getEmployee(id).then((value) {
      _employeeEntityData = value;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });

    notifyListeners();
  }

  void createEmployee(EmployeeEntityCompanion entity) {
    _appDb?.insertEmployee(entity).then((value) {
      _isAdded = value >= 1 ? true : false;
    }).onError((error, stackTrace) {
      error = _error.toString();
    });

    notifyListeners();
  }

  void updateEmployee(EmployeeEntityCompanion entity) {
    _appDb?.updateEmployee(entity).then((value) {
      _isUpdated = value;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });

    notifyListeners();
  }

  void deleteEmployee(int id) {
    _appDb?.deleteEmployee(id).then((value) {
      _isDeleted = value == 1 ? true : false;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });
  }
}
