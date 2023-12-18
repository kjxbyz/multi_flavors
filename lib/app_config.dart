enum Flavor { internal, external }

class AppConfig {
  String appName = "";
  String baseUrl = "";
  Flavor flavor = Flavor.internal;

  static AppConfig shared = AppConfig.create();

  factory AppConfig.create({
    String appName = "",
    String baseUrl = "",
    Flavor flavor = Flavor.internal,
  }) {
    return shared = AppConfig(appName, baseUrl, flavor);
  }

  AppConfig(this.appName, this.baseUrl, this.flavor);
}
