// ignore_for_file: file_names

enum ResultStatus { success, error }

class Result<T, E> {
  final E? error;
  final T? value;
  final ResultStatus status;

  Result.success(this.value)
      : status = ResultStatus.success,
        error = null;
  Result.failure(this.error)
      : status = ResultStatus.error,
        value = null;

  Result(this.status, this.error, this.value);
}
