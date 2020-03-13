// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return Employee()
    ..id = json['id'] as String
    ..empName = json['employee_name'] as String
    ..empSalary = json['employee_salary'] as String
    ..empAge = json['employee_age'] as String;
}

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'employee_name': instance.empName,
      'employee_salary': instance.empSalary,
      'employee_age': instance.empAge,
    };
