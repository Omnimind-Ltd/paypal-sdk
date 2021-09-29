import 'package:json_annotation/json_annotation.dart';
import 'payment_method.dart';

part 'application_context.g.dart';

/// Configures the label name to Continue or Subscribe Now for subscription
/// consent experience.
enum UserAction {
  /// After you redirect the customer to the PayPal subscription consent page, a
  /// Continue button appears. Use this option when you want to control the activation
  /// of the subscription and do not want PayPal to activate the subscription.
  @JsonValue('CONTINUE')
  continue_,

  ///  After you redirect the customer to the PayPal subscription consent page,
  ///  a Subscribe Now button appears. Use this option when you want PayPal to
  ///  activate the subscription.
  @JsonValue('SUBSCRIBE_NOW')
  subscribedNow,
}

/// The location from which the shipping address is derived.
enum ShippingPreference {
  ///  Get the customer-provided shipping address on the PayPal site.
  @JsonValue('GET_FROM_FILE')
  getFromFile,

  /// Redacts the shipping address from the PayPal site. Recommended for digital goods.
  @JsonValue('NO_SHIPPING')
  noShipping,

  ///  Get the merchant-provided address. The customer cannot change this address
  ///  on the PayPal site. If merchant does not pass an address, customer can
  ///  choose the address on PayPal pages.
  @JsonValue('SET_PROVIDED_ADDRESS')
  setProvidedAddress,
}

/// The application context, which customizes the payer experience during the
/// subscription approval process with PayPal.
@JsonSerializable(fieldRename: FieldRename.snake)
class ApplicationContext {
  /// The label that overrides the business name in the PayPal account on the PayPal site.
  final String? brandName;

  /// The BCP 47-formatted locale of pages that the PayPal payment experience shows.
  /// PayPal supports a five-character code. For example, da-DK, he-IL, id-ID,
  /// ja-JP, no-NO, pt-BR, ru-RU, sv-SE, th-TH, zh-CN, zh-HK, or zh-TW.
  final String? locale;

  /// The location from which the shipping address is derived.
  final ShippingPreference? shippingPreference;

  /// Configures the label name to Continue or Subscribe Now for subscription
  /// consent experience.
  final UserAction? userAction;

  /// The customer and merchant payment preferences. Currently only PAYPAL payment
  /// method is supported.
  final PaymentMethod? paymentMethod;

  /// The URL where the customer is redirected after the customer approves the payment.
  final String returnUrl;

  /// The URL where the customer is redirected after the customer cancels the payment.
  final String cancelUrl;

  const ApplicationContext(
      {this.brandName,
      this.locale,
      this.shippingPreference,
      this.userAction,
      this.paymentMethod,
      required this.returnUrl,
      required this.cancelUrl});

  Map<String, dynamic> toJson() => _$ApplicationContextToJson(this);

  factory ApplicationContext.fromJson(Map<String, dynamic> json) =>
      _$ApplicationContextFromJson(json);

  @override
  String toString() {
    return 'ApplicationContext{brandName: $brandName, locale: $locale, '
        'shippingPreference: $shippingPreference, userAction: $userAction, '
        'paymentMethod: $paymentMethod, returnUrl: $returnUrl, cancelUrl: $cancelUrl}';
  }
}
