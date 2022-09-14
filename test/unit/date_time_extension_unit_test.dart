import 'package:flutter_test/flutter_test.dart';
import 'package:meal_project/domain/extension/date_time_extension.dart';


void main(){
  //Define Test
  group('DateTime extension test', (){

    test('toFirstDateOfWeek test',(){
      var expected = DateTime(2022, 2, 14);
      var sample = DateTime(2022, 2, 14);
      var actual = sample.toFirstDateOfWeek();
      expect(actual, expected);
    });

    test('toLastDateOfWeek test',(){
      var expected = DateTime(2022, 2, 20);
      var sample = DateTime(2022, 2, 14);
      var actual = sample.toLastDateOfWeek();
      expect(actual, expected);
    });

  });
}