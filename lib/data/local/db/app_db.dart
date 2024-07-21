import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_project/data/local/entity/employee_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'employee.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [EmployeeEntity])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //GET THE LIST OF EMPLOYEE
  Future<List<EmployeeEntityData>> getEmployees() async {
    return await select(employeeEntity).get();
  }

  //GET EMPLOYEE BY ID
  Future<EmployeeEntityData> getEmployee(int id) async {
    return await (select(employeeEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateEmployee(EmployeeEntityCompanion entity) async {
    return await update(employeeEntity).replace(entity);
  }

  Future<int> insertEmployee(EmployeeEntityCompanion entity) async {
    return await into(employeeEntity).insert(entity);
  }

  Future<int> deleteEmployee(int id) async {
    return await (delete(employeeEntity)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
