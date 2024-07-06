// ignore_for_file: file_names

import 'package:flutter_application_test/src/base/ApiService/AppError.dart';
import 'package:flutter_application_test/src/features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCase.dart';
import 'package:flutter_application_test/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:flutter_application_test/src/services/FirebaseServices/AuthFirebaseService/Decodables/AuthErrorDecodable.dart';
import 'package:flutter_application_test/src/utils/Helpers/ResultType/ResultType.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../../../base/Constants/error_message.dart';

abstract class _Constants {
  static String correctEmail = "agustin15@gmail.com";
  static String correctPass = "123456";
  static String wrongEmail = "agustin14@gmail.com";
  static String wrongPass = "123456";
}

void main() {
  //GIVEN
  SignUpUseCase sut = DefaultSignUpUseCase();

  group('Test success SignUp user in Firebase', () {
    test('Test succes SignUp user in Firebase ', () async {
      final SignUpUseCaseParameters params = SignUpUseCaseParameters(
          email: _Constants.correctEmail,
          password: _Constants.correctPass,
          username: 'cane 2',
          date: '29/10/2001',
          phone: '123456');

      //WHEN (CUANDO PASE ALGO)
      final result = await sut.execute(params: params);

      switch (result.status) {
        case ResultStatus.success:
          //THEN
          expect(result.value, isA<SignUpEntity>());
          break;
        case ResultStatus.error:
          //THEN
          expect(result.error, Failure);
          break;
      }
    });
  });

  group('Test failure SignUp in Firebase', () {
    test('Test failure SignUp in Firebase', () async {
      try {
        //WHEN

        final SignUpUseCaseParameters params = SignUpUseCaseParameters(
            email: _Constants.wrongEmail,
            password: _Constants.wrongPass,
            username: 'cane 2',
            date: '29/10/2001',
            phone: '123456');

        final _ = await sut.execute(params: params);
      } on Failure catch (f) {
        //THEN

        AuthErrorDecodable error = f as AuthErrorDecodable;
        expect(error.error!.message, FBFailureMessages.emailExistMessage);
      }
    });

    //AÑADOR MAS TEST;)
  });
}
