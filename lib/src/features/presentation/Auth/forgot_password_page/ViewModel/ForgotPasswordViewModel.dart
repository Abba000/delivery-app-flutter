// ignore_for_file: file_names
import '../../../../domain/UseCases/Auth/UpdatePasswordUseCase/UpdatePasswordUseCase.dart';

abstract class UpdatePasswordViewModelInput {
  // Exposed Properties
  late String email;
  // Exposed Methods
  Future<void> updatePassword({required String email});
}

abstract class UpdatePasswordViewModel extends UpdatePasswordViewModelInput {}

class DefaultUpdatePasswordViewModel extends UpdatePasswordViewModel {
  // Dependencies
  final UpdatePasswordUseCase _updatePasswordUseCase;

  DefaultUpdatePasswordViewModel({UpdatePasswordUseCase? updatePasswordUseCase})
      : _updatePasswordUseCase =
            updatePasswordUseCase ?? DefaultUpdatePasswordUseCase();

  @override
  Future<void> updatePassword({required String email}) {
    return _updatePasswordUseCase.execute(email: email);
  }
}
