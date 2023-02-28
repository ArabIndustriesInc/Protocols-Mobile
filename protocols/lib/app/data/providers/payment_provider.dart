import 'package:get/get.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/payment_model.dart';

class PaymentProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Payment.fromJson(map);
      if (map is List) {
        return map.map((item) => Payment.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '${baseUrlApi}payment/addpayment';
  }

  Future<Payment?> getPayment(int id) async {
    final response = await get('payment/$id');
    return response.body;
  }

  Future<Response<Payment>> postPayment(Payment payment) async =>
      await post('payment', payment);
  Future<Response> deletePayment(int id) async => await delete('payment/$id');
}
