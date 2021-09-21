import 'dart:convert';

/// Paypal environment. Sandbox or live.
class PayPalEnvironment {
  final String clientId;
  final String clientSecret;
  final String host;
  final String webUrl;

  PayPalEnvironment(
      {required this.clientId,
      required this.clientSecret,
      required this.host,
      required this.webUrl});

  PayPalEnvironment.sandbox({
    required this.clientId,
    required this.clientSecret,
  })  : host = 'api.sandbox.paypal.com',
        webUrl = 'https://www.sandbox.paypal.com';

  PayPalEnvironment.live({
    required this.clientId,
    required this.clientSecret,
  })  : host = 'api.paypal.com',
        webUrl = 'https://www.paypal.com';

  String authorizationString() {
    var str = base64Encode('$clientId:$clientSecret'.codeUnits);
    return 'Basic $str';
  }

  @override
  String toString() {
    return 'PayPalEnvironment{clientId: $clientId, clientSecret: $clientSecret, '
        'host: $host, webUrl: $webUrl}';
  }
}
