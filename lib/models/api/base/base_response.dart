class BaseResponse<T> {
  final int? status;
  final T? snapshot;
  String? error;

  BaseResponse(
    this.status,
    this.snapshot,
    this.error,
  );
}
