// import 'package:test/test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:list_detail/util/my_sorting.dart';

void main() {
  group("Check sorting : ", () {
    test('Check sorting array', () {
      List expecedValue = [
        {'employee_name': 'Aun Chounry'},
        {'employee_name': 'Bhn Chounry'},
        {'employee_name': 'Chn Chounry'}
      ];

      List valueToTest = [
        {'employee_name': 'Bhn Chounry'},
        {'employee_name': 'Aun Chounry'},
        {'employee_name': 'Chn Chounry'}
      ];

      expect(MySorting.sortByName(valueToTest), expecedValue);
    });

    test('Check sorting array', () {
      List expecedValue = [
        {'employee_name': 'Aun Chounry'},
        {'employee_name': 'Aun Chounrz'},
        {'employee_name': 'Chn Chounry'}
      ];

      List valueToTest = [
        {'employee_name': 'Aun Chounrz'},
        {'employee_name': 'Aun Chounry'},
        {'employee_name': 'Chn Chounry'}
      ];

      expect(MySorting.sortByName(valueToTest), expecedValue);
    });
  });
}
