enum Flavor { internal, external }

class AppConfig {
  final String appName;
  final String baseUrl;
  final Flavor flavor;

  static AppConfig shared = AppConfig.create();

  factory AppConfig.create({
    String appName = "",
    String baseUrl = "",
    Flavor flavor = Flavor.internal,
  }) {
    return shared = AppConfig._(appName, baseUrl, flavor);
  }

  AppConfig._(this.appName, this.baseUrl, this.flavor);
}
