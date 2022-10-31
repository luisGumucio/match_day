class Config {
  static const baseUrl = String.fromEnvironment(
    'baseUrl',
    defaultValue: uri,
  );
  static const uri = 'http://192.168.1.14:8090';
}