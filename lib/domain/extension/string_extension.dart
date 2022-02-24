///import file [StringExtension] agar dapat menggunakan code ini
extension StringExtension on String {

  /// regex digunakan untuk menvalidasi email
  static final RegExp _emailRegExp = RegExp(
    r'^([A-Z|a-z|0-9](\.|_){0,1})+[A-Z|a-z|0-9]\@([A-Z|a-z|0-9])+((\.){0,1}[A-Z|a-z|0-9]){2}\.[a-z]{2,3}$',
  );

  /// regex digunakan untuk passowrd email dengan minimail memiliki angka, huruf kecil dan huruf besar
  static final RegExp _passwordRegExp = RegExp(
    r'^((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,64})$',
  );

  /// regex digunakan untuk no telepon
  static final RegExp _phoneRegExp = RegExp(r'^(?:[+0])?[0-9]{8,15}$');


  /// digunakan untuk mengkapitalkan string
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  /// digunkan untuk menganti @param [substring] terakhir yang ditemukan dan mengantinya dengan @param [replacement]
  String replaceLast(String substring, String replacement) {
    int index = lastIndexOf(substring);
    if (index == -1) return this;
    return this.substring(0, index) +
        replacement +
        this.substring(index + substring.length);
  }

  ///digunakan untuk menvalidasi email menggunakan [_emailRegExp]
  bool validateEmail() {
    return _emailRegExp.hasMatch(this);
  }

  ///digunakan untuk menvalidasi password menggunakan [_passwordRegExp]
  bool validatePassword() {
    return _passwordRegExp.hasMatch(this);
  }

  ///digunakan untuk menvalidasi no telepon menggunakan [_phoneRegExp]
  bool validatePhone() {
    return _phoneRegExp.hasMatch(this);
  }

  /// mengganti ' ' menjad url encode yaitu %20
  String toEncodeSpace() {
    return replaceAll(' ', '%20');
  }

}
