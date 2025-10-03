// ignore_for_file: file_names

import '../../../../domain/Entities/User/UserEntity.dart';
import '../../../../domain/UseCases/Auth/UpdateEmailUseCase/UpdateEmailUseCase.dart';

abstract class EditEmailPageViewModelInput {
  Future<UserEntity?> updateEmail(
      {required String oldEmail,
      required String email,
      required String password,
      required String localId});
}

abstract class EditEmailPageViewModel extends EditEmailPageViewModelInput {}

class DefaultEditEmailPageViewModel extends EditEmailPageViewModel {
  // * Dependencies
  final UpdateEmailUseCase _updateEmailUseCase;

  DefaultEditEmailPageViewModel({UpdateEmailUseCase? updateEmailUseCase})
      : _updateEmailUseCase = updateEmailUseCase ?? DefaultUpdateEmailUseCase();

  @override
  Future<UserEntity?> updateEmail(
      {required String oldEmail,
      required String email,
      required String password,
      required String localId}) {
    return _updateEmailUseCase.execute(
        newEmail: email,
        password: password,
        localId: localId,
        oldEmail: oldEmail);
  }
}
