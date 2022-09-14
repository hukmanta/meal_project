import 'package:flutter_test/flutter_test.dart';
import 'package:meal_project/domain/extension/string_extension.dart';

  void main(){
    //Define Test
    group('String extension test', (){
      test('test capitalize', (){
        // Arrange
        var expected = 'Hukman';
        var sample = 'hukman';
        // Act
        var actual = sample.capitalize();
        // Asset
        expect(actual,expected);
      });

      test('replace last test',(){
        var expected = 'hukman thayib';
        var sample = 'hukmanx';
        var actual = sample.replaceLast('x', ' thayib');
        expect(actual, expected);
      });

      test('validateEmail test',(){
        var expected = true;
        var sample = 'hukmanta@gmail.com';
        var actual = sample.validateEmail();
        expect(actual, expected);
      });

      test('validatePassword test',(){
        var expected = true;
        var sample = '21Jan1991';
        var actual = sample.validatePassword();
        expect(actual, expected);
      });

      test('validatePhone test',(){
        var expected = true;
        var sample = '089668239376';
        var actual = sample.validatePhone();
        expect(actual, expected);
      });

    });
  }