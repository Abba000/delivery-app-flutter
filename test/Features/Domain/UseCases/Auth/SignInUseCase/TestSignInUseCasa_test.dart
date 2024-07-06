// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/features/domain/Entities/Auth/SignInEntity/SignInEntity.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Auth/SignInUseCase/SignInUseCase.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Auth/SignInUseCase/SignInUseCaseBodyParameters.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Decodables/AuthErrorDecodable.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../base/Constants/error_message.dart';

abstract class _Constants {
  static String correctEmail = "agustin14@gmail.com";
  static String correctPass = "123456";
  static String wrongEmail = "agustin14@gmail.com";
  static String wrongPass = "123456";
}

void main() {
  // GIVEN
  final SignInUseCase sut = DefaultSignInUseCase();

  // Test correct response to SignInUseCase
  group('Test correct response to SignInUseCase', () {
    // Test correct signIn feature with correct email and password
    test('Test correct signIn feature with correct email and password',
        () async {
      // GIVEN
      final SignInUseCaseParameters signInBodyParams = SignInUseCaseParameters(
          email: _Constants.correctEmail, password: _Constants.correctPass);

      // WHEN
      var result = await sut.execute(params: signInBodyParams);

      switch (result.status) {
        case ResultStatus.success:
          // THEN
          expect(result.value, isA<SignInEntity>());
          break;
        case ResultStatus.error:
          // THEN
          expect(result.error, isA<Failure>());
          break;
      }
    });
  });

  group('Test failure response to SignInUseCase', () {
    test('Test failure response to SignInUseCase', () async {
      // GIVEN
      final SignInUseCaseParameters params = SignInUseCaseParameters(
          email: _Constants.wrongEmail, password: _Constants.wrongPass);

      try {
        final _ = await sut.execute(params: params);
      } on Failure catch (f) {
        AuthErrorDecodable error = f as AuthErrorDecodable;

        //THEN
        expect(error.error!.message, FBFailureMessages.emailNotFoundMessage);
      }
    });

    test('Test failure response to SignInUseCase with wrong password',
        () async {
      // GIVEN
      final SignInUseCaseParameters params = SignInUseCaseParameters(
          email: _Constants.correctEmail, password: _Constants.wrongPass);

      try {
        final _ = await sut.execute(params: params);
      } on Failure catch (f) {
        AuthErrorDecodable error = f as AuthErrorDecodable;

        //THEN
        expect(error.error!.message, FBFailureMessages.invalidPasswordMessage);
      }
    });

    //AÑADE MAS TEST ;
  });
}
