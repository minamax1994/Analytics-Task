class ApiResult<TData> {
  final bool isSuccess;
  final TData? outputModel;
  final String? errorMessage;

  bool get isFailure => !isSuccess;

  const ApiResult({required this.isSuccess, this.outputModel, this.errorMessage});

  const ApiResult.success([this.outputModel])
      : isSuccess = true,
        errorMessage = null;

  const ApiResult.error([this.errorMessage])
      : isSuccess = false,
        outputModel = null;
}
