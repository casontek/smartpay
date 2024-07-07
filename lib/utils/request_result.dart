
class Result<T> {
  final String message;
  final Status status;
  final T? data;

  Result(
      this.message,
      this.status,
      this.data
      );
}

enum Status {
  success,
  failed,
  timeout
}