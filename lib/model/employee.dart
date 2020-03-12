

class Employee{
  final String id;
  final String name;
  final String salary;
  final String age;

  Employee(this.id, this.name, this.salary, this.age);

  factory Employee.fromJson(Map<String, dynamic> json){

  }
}