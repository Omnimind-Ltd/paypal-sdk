import 'package:flutter_paypal_sdk/core.dart';
import 'package:flutter_paypal_sdk/src/orders/model/payment.dart';
import 'package:flutter_paypal_sdk/src/orders/model/purchase_unit.dart';
import 'package:json_annotation/json_annotation.dart';

import 'payer.dart';

part 'order.g.dart';

/// The intent to either capture payment immediately or authorize a payment for
/// an order after order creation.
enum OrderRequestIntent {
  /// The merchant intends to capture payment immediately after the customer makes a payment.
  @JsonValue('CAPTURE')
  capture,

  /// The merchant intends to authorize a payment and place funds on hold after
  /// the customer makes a payment. Authorized payments are best captured within
  /// three days of authorization but are available to capture for up to 29 days.
  /// After the three-day honor period, the original authorized payment expires
  /// and you must re-authorize the payment. You must make a separate request to
  /// capture payments on demand. This intent is not supported when you have more
  /// than one `purchase_unit` within your order.
  @JsonValue('AUTHORIZE')
  authorize,
}

/// The type of landing page to show on the PayPal site for customer checkout.
enum LandingPage {
  /// When the customer clicks PayPal Checkout, the customer is redirected to a
  /// page to log in to PayPal and approve the payment.
  @JsonValue('LOGIN')
  login,

  /// When the customer clicks PayPal Checkout, the customer is redirected to a
  /// page to enter credit or debit card and other relevant billing information
  /// required to complete the purchase.
  @JsonValue('BILLING')
  billing,

  /// When the customer clicks PayPal Checkout, the customer is redirected to
  /// either a page to log in to PayPal and approve the payment or to a page to
  /// enter credit or debit card and other relevant billing information required
  /// to complete the purchase, depending on their previous interaction with PayPal.
  @JsonValue('NO_PREFERENCE')
  noPreference,
}

/// The shipping preference:
/// <ul>
/// <li>
/// Displays the shipping address to the customer.
/// </li>
/// <li>
/// Enables the customer to choose an address on the PayPal site.
/// </li>
/// <li>
/// Restricts the customer from changing the address during the payment-approval process.
/// </li>
/// </ul>
enum ShippingPreference {
  /// Use the customer-provided shipping address on the PayPal site.
  @JsonValue('GET_FROM_FILE')
  getFromFile,

  /// Redact the shipping address from the PayPal site. Recommended for digital goods.
  @JsonValue('NO_SHIPPING')
  noShipping,

  /// Use the merchant-provided address. The customer cannot change this address on the PayPal site.
  @JsonValue('SET_PROVIDED_ADDRESS')
  setProvidedAddress,
}

/// Configures a Continue or Pay Now checkout flow.
enum UserAction {
  /// After you redirect the customer to the PayPal payment page, a Continue
  /// button appears. Use this option when the final amount is not known when the
  /// checkout flow is initiated and you want to redirect the customer to the
  /// merchant page without processing the payment.
  @JsonValue('CONTINUE')
  continue_,

  /// After you redirect the customer to the PayPal payment page, a Pay Now button
  /// appears. Use this option when the final amount is known when the checkout
  /// is initiated and you want to process the payment immediately when the
  /// customer clicks Pay Now.
  @JsonValue('PAY_NOW')
  payNow,
}

/// An order.
@JsonSerializable(fieldRename: FieldRename.snake)
class Order {
  /// The ID of the order.
  final String? id;

  /// The payment source used to fund the payment.
  final PaymentSource? paymentSource;

  /// The intent to either capture payment immediately or authorize a payment for
  /// an order after order creation.
  final String? intent;

  /// The customer who approves and pays for the order. The customer is also known
  /// as the payer.
  final Payer? payer;

  /// An array of purchase units. Each purchase unit establishes a contract between
  /// a customer and merchant. Each purchase unit represents either a full or
  /// partial order that the customer intends to purchase from the merchant.
  final List<PurchaseUnit>? purchaseUnits;

  /// The order status.
  final String? status;

  /// The date and time when the transaction occurred, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? createTime;

  /// The date and time when the transaction was last updated, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? updateTime;

  /// An array of request-related HATEOAS links.
  final List<LinkDescription>? links;

  const Order(
      {this.id,
      this.paymentSource,
      this.intent,
      this.payer,
      this.purchaseUnits,
      this.status,
      this.createTime,
      this.updateTime,
      this.links});

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  @override
  String toString() {
    return 'Order{id: $id, paymentSource: $paymentSource, intent: $intent, '
        'payer: $payer, purchaseUnits: $purchaseUnits, status: $status, '
        'createTime: $createTime, updateTime: $updateTime, links: $links}';
  }
}

/// An order request object.
@JsonSerializable(fieldRename: FieldRename.snake)
class OrderRequest {
  /// The intent to either capture payment immediately or authorize a payment
  /// for an order after order creation.
  final OrderRequestIntent intent;

  /// The customer who approves and pays for the order. The customer is also known
  /// as the payer.
  final Payer? payer;

  /// An array of purchase units. Each purchase unit establishes a contract
  /// between a payer and the payee. Each purchase unit represents either a full
  /// or partial order that the payer intends to purchase from the payee.
  final List<PurchaseUnitRequest> purchaseUnits;

  /// Customize the payer experience during the approval process for the payment
  /// with PayPal.
  final ApplicationContext? applicationContext;

  const OrderRequest(
      {required this.intent, this.payer, required this.purchaseUnits, this.applicationContext});

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);

  factory OrderRequest.fromJson(Map<String, dynamic> json) => _$OrderRequestFromJson(json);

  @override
  String toString() {
    return 'OrderRequest{intent: $intent, payer: $payer, '
        'purchaseUnits: $purchaseUnits, applicationContext: $applicationContext}';
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ApplicationContext {
  /// The label that overrides the business name in the PayPal account on the PayPal site.
  final String? brandName;

  /// The BCP 47-formatted locale of pages that the PayPal payment experience shows.
  /// PayPal supports a five-character code. For example, da-DK, he-IL, id-ID,
  /// ja-JP, no-NO, pt-BR, ru-RU, sv-SE, th-TH, zh-CN, zh-HK, or zh-TW.
  final String? locale;

  /// The type of landing page to show on the PayPal site for customer checkout.
  final LandingPage? landingPage;

  /// The shipping preference:
  /// <ul>
  /// <li>
  /// Displays the shipping address to the customer.
  /// </li>
  /// <li>
  /// Enables the customer to choose an address on the PayPal site.
  /// </li>
  /// <li>
  /// Restricts the customer from changing the address during the payment-approval process.
  /// </li>
  /// </ul>
  final ShippingPreference? shippingPreference;

  /// Configures a Continue or Pay Now checkout flow.
  final UserAction? userAction;

  /// The customer and merchant payment preferences.
  final PaymentMethod? paymentMethod;

  /// The URL where the customer is redirected after the customer approves the payment.
  final String? returnUrl;

  /// The URL where the customer is redirected after the customer cancels the payment.
  final String? cancelUrl;

  /// Provides additional details to process a payment using a payment_source that
  /// has been stored or is intended to be stored (also referred to as
  /// stored_credential or card-on-file).
  /// Parameter compatibility:
  /// <ul>
  /// <li>
  /// payment_type=ONE_TIME is compatible only with payment_initiator=CUSTOMER.
  /// </li>
  /// <li>
  /// usage=FIRST is compatible only with payment_initiator=CUSTOMER.
  /// </li>
  /// <li>
  /// previous_transaction_reference or previous_network_transaction_reference
  /// is compatible only with payment_initiator=MERCHANT.
  /// </li>
  /// <li>
  /// Only one of the parameters - previous_transaction_reference and
  /// previous_network_transaction_reference - can be present in the request.
  /// </li>
  /// </ul>
  final StoredPaymentSource? storedPaymentSource;

  const ApplicationContext({
    this.brandName,
    this.locale,
    this.landingPage,
    this.shippingPreference,
    this.userAction,
    this.paymentMethod,
    this.returnUrl,
    this.cancelUrl,
    this.storedPaymentSource,
  });

  Map<String, dynamic> toJson() => _$ApplicationContextToJson(this);

  factory ApplicationContext.fromJson(Map<String, dynamic> json) =>
      _$ApplicationContextFromJson(json);

  @override
  String toString() {
    return 'ApplicationContext{brandName: $brandName, locale: $locale, '
        'landingPage: $landingPage, shippingPreference: $shippingPreference, '
        'userAction: $userAction, paymentMethod: $paymentMethod, returnUrl: $returnUrl, '
        'cancelUrl: $cancelUrl, storedPaymentSource: $storedPaymentSource}';
  }
}
