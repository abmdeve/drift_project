import 'package:drift/drift.dart' as drift;
import 'package:drift_project/data/local/db/app_db.dart';
import 'package:drift_project/screens/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditEmployeeScreen extends StatefulWidget {
  final int id;

  const EditEmployeeScreen({super.key, required this.id});

  @override
  State<EditEmployeeScreen> createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  //late AppDb _db;
  late EmployeeEntityData _employeeData;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();

  DateTime? _dateOfBirth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //_db = AppDb();

    getEmployee();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //_db.close();
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Employee"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              editEmployee();
            },
            icon: const Icon(Icons.save),
          ),
          IconButton(
            onPressed: () {
              deleteEmployee();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  CustomTextFormField(
                      controller: _userNameController, textLabel: "User Name"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextFormField(
                      controller: _firstNameController,
                      textLabel: "First Name"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextFormField(
                      controller: _lastNameController, textLabel: "Last Name"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextFormField(
                    onTap: () {
                      pickDateOfBirth(context: context);
                    },
                    controller: _dateOfBirthController,
                    textLabel: "Date of birth",
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickDateOfBirth({required BuildContext context}) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: _dateOfBirth ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) => Theme(
        data: ThemeData().copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.pink,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child ?? const Text(""),
      ),
    );

    if (newDate == null) {
      return;
    }

    setState(() {
      _dateOfBirth = newDate;
      String dob = DateFormat('dd/MM/yyyy').format(newDate);
      _dateOfBirthController.text = dob;
    });
  }

  void editEmployee() {
    final isValid = _formKey.currentState?.validate();

    if(isValid != null && isValid){
      final entity = EmployeeEntityCompanion(
        id: drift.Value(widget.id),
        userName: drift.Value(_userNameController.text),
        firstName: drift.Value(_firstNameController.text),
        lastName: drift.Value(_lastNameController.text),
        dateOfBirth: drift.Value(_dateOfBirth!),
      );

      //_db
      Provider.of<AppDb>(context).
          updateEmployee(entity).then(
            (value) => ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                backgroundColor: Colors.pink,
                content: Text(
                  "Employee updated: $value",
                  style: const TextStyle(color: Colors.white),
                ),
                actions: [
                  TextButton(
                    onPressed: () => ScaffoldMessenger.of(context)
                        .hideCurrentMaterialBanner(),
                    child: const Text(
                      "Close",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
    }
  }

  void deleteEmployee() {
    Provider.of<AppDb>(context, listen: false).
    //_db.
    deleteEmployee(widget.id).then(
          (value) => ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              backgroundColor: Colors.pink,
              content: Text(
                "Employee deleted: $value",
                style: const TextStyle(color: Colors.white),
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                  child: const Text(
                    "Close",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
  }

  Future<void> getEmployee() async {
    _employeeData = await Provider.of<AppDb>(context, listen: false).getEmployee(widget.id);

    _userNameController.text = _employeeData.userName;
    _firstNameController.text = _employeeData.firstName;
    _lastNameController.text = _employeeData.lastName;
    _dateOfBirthController.text = _employeeData.dateOfBirth.toIso8601String();
  }
}
