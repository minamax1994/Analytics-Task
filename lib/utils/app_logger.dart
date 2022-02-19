import 'dart:developer';

class DevLogger {
  void error({String? tag, required String? message, Object? error}) {
    log("Error: $message", time: DateTime.now(), name: tag!, error: error);
  }

  void info({String? tag, required String? message}) {
    log("Info: $message", time: DateTime.now(), name: tag!);
  }
}

class LoggerWithTag implements DevLogger {
  final String _tag;
  final DevLogger _logger;

  LoggerWithTag(this._tag, this._logger);

  @override
  void error({String? tag, required String? message, Object? error}) {
    _logger.error(tag: _tag, message: message, error: error);
  }

  @override
  void info({String? tag, required String? message}) {
    _logger.info(tag: _tag, message: message);
  }
}
