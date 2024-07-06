// ignore_for_file: file_names

import 'package:flutter_application_test/src/features/data/Repositories/Auth/UpdatePassword/UpdatePasswordRepository.dart';
import 'package:flutter_application_test/src/features/data/Interfaces/Interfaces.dart';

abstract class UpdatePasswordUseCase {
  Future<void> execute({required String email});
}

class DefaultUpdatePasswordUseCase extends UpdatePasswordUseCase {
  // * Dependencies
  final UpdatePasswordRepository _updatePasswordRepository;

  DefaultUpdatePasswordUseCase(
      {UpdatePasswordRepository? updatePasswordRepository})
      : _updatePasswordRepository =
            updatePasswordRepository ?? DefaultUpdatePasswordRepository();

  @override
  Future<void> execute({required String email}) {
    return _updatePasswordRepository.updatePassword(email: email);
  }
}
