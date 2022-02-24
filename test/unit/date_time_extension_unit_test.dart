import 'package:flutter_test/flutter_test.dart';
import 'package:template_project/domain/extension/date_time_extension.dart';


void main(){
  //Define Test
  group("DateTime extension test", (){
    test("printByPattern", (){
      // Arrange
      var expected = 'Mon, 2/14/2022 01:00:00';
      var sample = DateTime(2022, 2, 14, 1, 0, 0);
      // Act
      var actual = sample.printByPattern(pattern: 'EEE, M/d/y hh:mm:ss');
      // Asset
      expect(actual,expected);
    });

    test("toFirstDateOfWeek test",(){
      var expected = DateTime(2022, 2, 14);
      var sample = DateTime(2022, 2, 14);
      var actual = sample.toFirstDateOfWeek();
      expect(actual, expected);
    });

    test("toLastDateOfWeek test",(){
      var expected = DateTime(2022, 2, 20);
      var sample = DateTime(2022, 2, 14);
      var actual = sample.toLastDateOfWeek();
      expect(actual, expected);
    });

  });
}