class ApiConstants {
  static const String baseUrl = 'https://staging.bricksandagent.com/';

  static const int connectTimeout = 10000;
  static const int receiveTimeout = 10000;

  static const String loginEndpoint = 'auth/login';
  static const String jobListEndpoint = 'smartView/pm/jobList';

  static const String defaultPageNumber = '1';
  static const String defaultPageSize = '10';
  static const String defaultHeaderPm = '102';

  static const Map<String, String> defaultHeaders = {
    'Connection': 'keep-alive',
    'Content-Type': 'application/json',
    'ChannelId': 'T4E18DDD47BDE8958C579F1C',
    'ClientSecret': '134C18DDDE478DDE895BC5769FB1C',
  };
}
