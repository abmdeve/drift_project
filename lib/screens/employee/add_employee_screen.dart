import 'package:drift_project/screens/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Employee"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //TODO:
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormField(
                controller: _userNameController, textLabel: "User Name"),
            const SizedBox(
              height: 8.0,
            ),
            CustomTextFormField(
                controller: _firstNameController, textLabel: "First Name"),
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
    );
  }

  Future<void> pickDateOfBirth({required BuildContext context}) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
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
      _dateOfBirthController.text = newDate.toIso8601String();
    });
  }
}
