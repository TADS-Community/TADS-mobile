import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tads_app/generated/locale_keys.g.dart';

abstract class Failure {
  final String errorMessage;
  final num statusCode;

  Failure(this.errorMessage, this.statusCode);
}

class ServerFailure implements Failure {
  final String message;
  final num code;

  ServerFailure({required this.message, required this.code});

  @override
  String get errorMessage => message;

  @override
  num get statusCode => code;
}

class DioFailure implements Failure {
  final DioError error;

  DioFailure({required this.error});

  @override
  num get statusCode => error.response?.statusCode ?? 500;

  @override
  String get errorMessage {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return LocaleKeys.error_internet.tr();
      case DioErrorType.sendTimeout:
        return LocaleKeys.error_internet.tr();
      case DioErrorType.receiveTimeout:
        return LocaleKeys.error_internet.tr();
      case DioErrorType.badCertificate:
        return LocaleKeys.error_server.tr();
      case DioErrorType.badResponse:
        return LocaleKeys.error_server.tr();
      case DioErrorType.cancel:
        return LocaleKeys.error_internet.tr();
      case DioErrorType.connectionError:
        return LocaleKeys.error_server.tr();
      case DioErrorType.unknown:
        return LocaleKeys.error_unknown.tr();
    }
  }
}

class ParsingFailure extends Failure {
  ParsingFailure() : super('',500);
}
