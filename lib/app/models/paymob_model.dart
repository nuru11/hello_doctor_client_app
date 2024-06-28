enum PaymobPaymentType { card, kiosk }

class PaymobModelResponse {
  late String token;
  String? kioskCode;
  PaymobModelResponse({required this.token, this.kioskCode});
}
