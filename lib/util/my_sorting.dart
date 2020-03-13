

class MySorting {
  static List sortByName(List array) {
    if (array == null) {
      return [];
    }
    array.sort(
        (a, b) => a['employee_name'].toString().compareTo(b['employee_name']));
    return array;
  }

  static List sortByAge(List array) {
    if (array == null) {
      return [];
    }
    array.sort(
        (a, b) => a['employee_age'].toString().compareTo(b['employee_age']));
    return array;
  }

  static List sortBySalary(List array) {
    if (array == null) {
      return [];
    }
    array.sort((a, b) =>
        a['employee_salary'].toString().compareTo(b['employee_salary']));
    return array;
  }
}
