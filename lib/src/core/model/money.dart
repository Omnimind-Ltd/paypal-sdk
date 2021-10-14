import 'package:json_annotation/json_annotation.dart';

part 'money.g.dart';

/// Monetary value.
@JsonSerializable(fieldRename: FieldRename.snake)
class Money {
  /// The <a href="https://developer.paypal.com/docs/integration/direct/rest/currency-codes/">
  /// three-character ISO-4217 currency code</a> that identifies the currency.
  final String currencyCode;

  /// The value, which might be:
  /// <ul>
  /// <li>
  /// An integer for currencies like JPY that are not typically fractional.
  /// </li>
  /// <li>
  /// A decimal fraction for currencies like TND that are subdivided into thousandths.
  /// </li>
  ///
  /// For the required number of decimal places for a currency code, see
  /// <a href="https://developer.paypal.com/docs/integration/direct/rest/currency-codes/">
  /// Currency Codes.</a>
  ///
  /// Maximum length: 32
  final String value;

  Money({required this.currencyCode, required this.value});

  Map<String, dynamic> toJson() => _$MoneyToJson(this);

  factory Money.fromJson(Map<String, dynamic> json) => _$MoneyFromJson(json);

  @override
  String toString() {
    return 'Money{currencyCode: $currencyCode, value: $value}';
  }
}

/// Exchange rate.
@JsonSerializable(fieldRename: FieldRename.snake)
class ExchangeRate {
  /// The source currency from which to convert an amount.
  final String sourceCurrency;

  /// The target currency to which to convert an amount.
  final String targetCurrency;

  /// The target currency amount. Equivalent to one unit of the source currency.
  /// Formatted as integer or decimal value with one to 15 digits to the right
  /// of the decimal point.
  final String value;

  const ExchangeRate(this.sourceCurrency, this.targetCurrency, this.value);

  Map<String, dynamic> toJson() => _$ExchangeRateToJson(this);

  factory ExchangeRate.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRateFromJson(json);

  @override
  String toString() {
    return 'ExchangeRate{sourceCurrency: $sourceCurrency, targetCurrency: $targetCurrency, value: $value}';
  }
}
