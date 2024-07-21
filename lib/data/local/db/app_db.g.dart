// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $EmployeeEntityTable extends EmployeeEntity
    with TableInfo<$EmployeeEntityTable, EmployeeEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeeEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
      'date_of_birth', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userName, firstName, lastName, dateOfBirth];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employee_entity';
  @override
  VerificationContext validateIntegrity(Insertable<EmployeeEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmployeeEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeeEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      dateOfBirth: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_of_birth'])!,
    );
  }

  @override
  $EmployeeEntityTable createAlias(String alias) {
    return $EmployeeEntityTable(attachedDatabase, alias);
  }
}

class EmployeeEntityData extends DataClass
    implements Insertable<EmployeeEntityData> {
  final int id;
  final String userName;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  const EmployeeEntityData(
      {required this.id,
      required this.userName,
      required this.firstName,
      required this.lastName,
      required this.dateOfBirth});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(userName);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    return map;
  }

  EmployeeEntityCompanion toCompanion(bool nullToAbsent) {
    return EmployeeEntityCompanion(
      id: Value(id),
      userName: Value(userName),
      firstName: Value(firstName),
      lastName: Value(lastName),
      dateOfBirth: Value(dateOfBirth),
    );
  }

  factory EmployeeEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeeEntityData(
      id: serializer.fromJson<int>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      dateOfBirth: serializer.fromJson<DateTime>(json['dateOfBirth']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userName': serializer.toJson<String>(userName),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'dateOfBirth': serializer.toJson<DateTime>(dateOfBirth),
    };
  }

  EmployeeEntityData copyWith(
          {int? id,
          String? userName,
          String? firstName,
          String? lastName,
          DateTime? dateOfBirth}) =>
      EmployeeEntityData(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      );
  EmployeeEntityData copyWithCompanion(EmployeeEntityCompanion data) {
    return EmployeeEntityData(
      id: data.id.present ? data.id.value : this.id,
      userName: data.userName.present ? data.userName.value : this.userName,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      dateOfBirth:
          data.dateOfBirth.present ? data.dateOfBirth.value : this.dateOfBirth,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeEntityData(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('dateOfBirth: $dateOfBirth')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userName, firstName, lastName, dateOfBirth);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeEntityData &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.dateOfBirth == this.dateOfBirth);
}

class EmployeeEntityCompanion extends UpdateCompanion<EmployeeEntityData> {
  final Value<int> id;
  final Value<String> userName;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<DateTime> dateOfBirth;
  const EmployeeEntityCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
  });
  EmployeeEntityCompanion.insert({
    this.id = const Value.absent(),
    required String userName,
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
  })  : userName = Value(userName),
        firstName = Value(firstName),
        lastName = Value(lastName),
        dateOfBirth = Value(dateOfBirth);
  static Insertable<EmployeeEntityData> custom({
    Expression<int>? id,
    Expression<String>? userName,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<DateTime>? dateOfBirth,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
    });
  }

  EmployeeEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? userName,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<DateTime>? dateOfBirth}) {
    return EmployeeEntityCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeEntityCompanion(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('dateOfBirth: $dateOfBirth')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $EmployeeEntityTable employeeEntity = $EmployeeEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [employeeEntity];
}

typedef $$EmployeeEntityTableCreateCompanionBuilder = EmployeeEntityCompanion
    Function({
  Value<int> id,
  required String userName,
  required String firstName,
  required String lastName,
  required DateTime dateOfBirth,
});
typedef $$EmployeeEntityTableUpdateCompanionBuilder = EmployeeEntityCompanion
    Function({
  Value<int> id,
  Value<String> userName,
  Value<String> firstName,
  Value<String> lastName,
  Value<DateTime> dateOfBirth,
});

class $$EmployeeEntityTableTableManager extends RootTableManager<
    _$AppDb,
    $EmployeeEntityTable,
    EmployeeEntityData,
    $$EmployeeEntityTableFilterComposer,
    $$EmployeeEntityTableOrderingComposer,
    $$EmployeeEntityTableCreateCompanionBuilder,
    $$EmployeeEntityTableUpdateCompanionBuilder> {
  $$EmployeeEntityTableTableManager(_$AppDb db, $EmployeeEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EmployeeEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EmployeeEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userName = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<DateTime> dateOfBirth = const Value.absent(),
          }) =>
              EmployeeEntityCompanion(
            id: id,
            userName: userName,
            firstName: firstName,
            lastName: lastName,
            dateOfBirth: dateOfBirth,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userName,
            required String firstName,
            required String lastName,
            required DateTime dateOfBirth,
          }) =>
              EmployeeEntityCompanion.insert(
            id: id,
            userName: userName,
            firstName: firstName,
            lastName: lastName,
            dateOfBirth: dateOfBirth,
          ),
        ));
}

class $$EmployeeEntityTableFilterComposer
    extends FilterComposer<_$AppDb, $EmployeeEntityTable> {
  $$EmployeeEntityTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get userName => $state.composableBuilder(
      column: $state.table.userName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dateOfBirth => $state.composableBuilder(
      column: $state.table.dateOfBirth,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$EmployeeEntityTableOrderingComposer
    extends OrderingComposer<_$AppDb, $EmployeeEntityTable> {
  $$EmployeeEntityTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get userName => $state.composableBuilder(
      column: $state.table.userName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dateOfBirth => $state.composableBuilder(
      column: $state.table.dateOfBirth,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$EmployeeEntityTableTableManager get employeeEntity =>
      $$EmployeeEntityTableTableManager(_db, _db.employeeEntity);
}
