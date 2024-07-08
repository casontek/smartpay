
class Result<T> {
  final String message;
  final NetworkStatus status;
  final T? data;

  Result(
      this.message,
      this.status,
      this.data
      );
}

enum NetworkStatus {
  success,
  failed,
  timeout
}