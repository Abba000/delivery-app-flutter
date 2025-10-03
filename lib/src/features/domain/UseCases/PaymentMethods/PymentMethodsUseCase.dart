// ignore_for_file: file_names

import '../../../../base/ApiService/AppError.dart';
import '../../../../base/Constants/ErrorMessage.dart';
import '../../../Data/Repositories/PaymentMethods/PaymentMethodsRepository.dart';
import '../../Entities/PaymentMethods/PaymentMethodsEntity.dart';

abstract class PaymentMethodsUseCase {
  Future<PaymentMethodsEntity> getPaymentMethods({required String localId});
  Future<PaymentMethodsEntity> savePaymentMethods(
      {required String localId, required PaymentMethodsEntity parameters});
}

class DefaultPaymentMethodsUseCase extends PaymentMethodsUseCase {
  // * Dependencies
  final PaymentMethodsRepository _paymentMethodsRepository;

  DefaultPaymentMethodsUseCase(
      {PaymentMethodsRepository? paymentMethodsRepository})
      : _paymentMethodsRepository =
            paymentMethodsRepository ?? DefaultPaymentMethodsRepository();

  @override
  Future<PaymentMethodsEntity> getPaymentMethods(
      {required String localId}) async {
    return _paymentMethodsRepository.getPaymentMethods(localId: localId).then(
        (response) {
      return PaymentMethodsEntity.fromMap(response.toMap());
    }, onError: (e) {
      return Future.error(Failure.fromMessage(
          message: AppFailureMessages.unExpectedErrorMessage));
    });
  }

  @override
  Future<PaymentMethodsEntity> savePaymentMethods(
      {required String localId,
      required PaymentMethodsEntity parameters}) async {
    return _paymentMethodsRepository
        .savePaymentMethods(
            localId: localId,
            bodyParameters: parameters.getPaymentMethodsBodyParameters())
        .then((response) {
      return PaymentMethodsEntity.fromMap(response.toMap());
    }, onError: (e) {
      return Future.error(Failure.fromMessage(
          message: AppFailureMessages.unExpectedErrorMessage));
    });
  }
}
