import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/fpdart.dart';

class CommonUtils {
  /// standar negara untuk menelepon
  static const String defaultCountryCallingCode = '+62';

  /// static function untuk mendapatkan jenis kelamin dimana @param [gender] bernilai 1 adalah laki-laki
  static List<String> gender(int gender) {
    return gender == 1
        ? ['Male', 'Cowok', 'Pria', 'Laki-laki']
        : ['Female', 'Cewek', 'Wanita', 'Perempuan'];
  }

  /// static function untuk mencari  nilai @param [comparedTo] apakah terdapat dalam map @param [map]
  static Either<bool, bool> containsValue(
      Map<String, dynamic> map, String comparedTo) {
    bool isContains = false;
    map.forEach((key, value) {
      if (!isContains) {
        isContains =
            value.toString().toLowerCase().contains(comparedTo.toLowerCase());
      }
    });
    return isContains ? right(true) : left(false);
  }

  /* static function untuk mengkonversi @param [amount] ke dalam format uang
  static String currencyFormat(double amount) {
    NumberFormat format = NumberFormat("#,##0.00", "id_ID");
    return 'Rp. ' + format.format(amount);
  }*/

  /// static function untuk mendapatkan inital awal dari string @param [value]
  static Either<String, String> getInitials(String value) {
    if (value.isNotEmpty) {
      return right(value
          .trim()
          .split(' ')
          .map((e) => e[0])
          .take(2)
          .join()
          .toUpperCase());
    }
    return left('');
  }

  /// static function untuk mendapatkan penjelasan string dari @param [type]
  static String delegateTypeString(int type) {
    switch (type) {
      case 0:
        return 'Delegate Approval';
      case 1:
        return 'Delegate Request';
      case 2:
        return 'Delegate Approval and Request';
      default:
        return 'None';
    }
  }

  /// static function untuk mengecek koneksi internet menggunakan  @param [connectivity]
  static Future<bool> checkInternetConnection(Connectivity connectivity) async {
    var result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  /// static function untuk menghasilkan string random alpanumerik dengan panjang @param [length]
  static String getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }
}