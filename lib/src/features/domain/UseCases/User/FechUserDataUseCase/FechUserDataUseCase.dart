// ignore_for_file: constant_pattern_never_matches_value_type, file_names

import '../../../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../../../../base/ApiService/AppError.dart';
import '../../../../../base/Constants/ErrorMessage.dart';
import '../../../../data/Repositories/User/FechUserDataRepository.dart';
import '../../../Entities/User/UserEntity.dart';

abstract class FetchUserDataUseCase {
  Future<UserEntity> execute({required String localId});
}

class DefaultFetchUserDataUseCase extends FetchUserDataUseCase {
  // Dependencies
  final FetchUserDataRepository _fetchUserDataRepository;

  DefaultFetchUserDataUseCase(
      {FetchUserDataRepository? fetchUserDataRepository})
      : _fetchUserDataRepository =
            fetchUserDataRepository ?? DefaultFetchUserDataRepository();

  @override
  Future<UserEntity> execute({required String localId}) {
    return _fetchUserDataRepository
        .fetchUserData(localId: localId)
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Future.error(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          return UserEntity.fromMap(result.value!.toMap());
        case ResultStatus.error:
          return Future.error(Failure.fromMessage(
              message: AppFailureMessages.unExpectedErrorMessage));
        default:
          return Future.error(Failure.fromMessage(
              message: AppFailureMessages.unExpectedErrorMessage));
      }
    });
  }
}
