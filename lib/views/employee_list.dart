import 'package:flutter/material.dart';
import 'package:zyluapp/controllers/employee_controller.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  var employeeList = [];
  EmployeeController employeeController = EmployeeController();

  @override
  void initState() {
    employeeController.fetchAllEmployee().then((value) {
      setState(() {
        employeeList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        employeeList.isEmpty
            ? const Center(
                child: Text('No employee found'),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: employeeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      tileColor: (employeeList[index].active &&
                              employeeList[index].experience >= 5)
                          ? Colors.green[200]
                          : Colors.white,
                      title: Text(employeeList[index].name),
                      subtitle: Text(
                          "Experience: ${employeeList[index].experience} years"),
                      trailing: Text(
                          employeeList[index].active ? 'Active' : 'Inactive'),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
