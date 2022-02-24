enum Flavor { development, production }

class FlavorValues {
  FlavorValues(
      { this.debug = false,
        this.byPassWaLogin = false,
        this.byPassWaForgotPassword = false,
        required this.apiUrl,
        required this.apiKey,
      });

  final String apiUrl;
  final String apiKey;
  final bool debug;
  final bool byPassWaLogin;
  final bool byPassWaForgotPassword;

//Add other flavor specific values, e.g database name
}

class FlavorConfig {
  late final Flavor flavor;
  late final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig({required Flavor flavor, required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(flavor, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.values);

  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isProduction() => _instance?.flavor == Flavor.production;

  static bool isDevelopment() => _instance?.flavor == Flavor.development;

  static bool isDebug() => _instance?.values.debug ?? false;
}
