class DataLoadResult<T> {
  T data;
  LoadingError error;

  DataLoadResult({
    this.data,
    this.error = LoadingError.NONE,
  });

  bool isSuccessful() {
    return error == null || error == LoadingError.NONE;
  }
}

enum LoadingError {
  NONE,
  NO_CONNECTION,
  SERVER_REQUEST_FAILED,
}
