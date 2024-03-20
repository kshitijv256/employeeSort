import 'package:zyluapp/database.dart';
import 'package:zyluapp/models/employee_model.dart';

class EmployeeController {
  var collection = MongoDatabase.db?.collection('employee');
  void addEmployee(String name, int yoe, bool active) {
    collection!.insertOne({
      'name': name,
      'experience': yoe,
      'active': active,
    });
  }

  Future<List<Employee>> fetchAllEmployee() async {
    var myList = collection!.find().toList().then((value) {
      var empList = value.map((e) => Employee.fromJson(e)).toList();
      return empList;
    });
    return myList;
  }
}
