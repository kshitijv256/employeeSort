class Employee {
  int id;
  String name;
  String salary;

  Employee({required this.id, required this.name, required this.salary});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['employee_name'],
      salary: json['employee_salary'],
    );
  }
}
