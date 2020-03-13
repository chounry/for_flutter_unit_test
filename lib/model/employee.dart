import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  String id;
  @JsonKey(name: 'employee_name')
  String empName;
  @JsonKey(name: 'employee_salary')
  String empSalary;
  @JsonKey(name: 'employee_age')
  String empAge;

  Employee();

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
