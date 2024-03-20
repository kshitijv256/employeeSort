import 'package:flutter/material.dart';
import 'package:zyluapp/controllers/employee_controller.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  EmployeeController employeeController = EmployeeController();
  TextEditingController nameController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  bool active = true;

  void addEmployee() {
    if (nameController.text.isEmpty || experienceController.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Please fill all the fields'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    employeeController.addEmployee(
      nameController.text,
      int.parse(experienceController.text),
      active,
    );
    nameController.clear();
    experienceController.clear();
    const snackBar = SnackBar(
      content: Text('Employee added successfully'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: experienceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: 'Years of Experience',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                )),
          ),
          ListTile(
            title: const Text('Active'),
            leading: Radio(
                value: true,
                groupValue: active,
                onChanged: (value) {
                  setState(() {
                    active = value as bool;
                  });
                }),
          ),
          ListTile(
            title: const Text('Inactive'),
            leading: Radio(
                value: false,
                groupValue: active,
                onChanged: (value) {
                  setState(() {
                    active = value as bool;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
              ),
              onPressed: () {
                addEmployee();
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
