class ServerException implements Exception {
  final String errorMessage;
  final num statusCode;

  const ServerException({this.statusCode = 400, this.errorMessage = 'error'});

  @override
  String toString() =>
      'ServerException(statusCode: $statusCode, errorMessage: $errorMessage)';
}

class DioException implements Exception {}

class ParsingException implements Exception {
  final String errorMessage;

  const ParsingException({required this.errorMessage});
}

class CacheException implements Exception {
  final String errorMessage;

  const CacheException({required this.errorMessage});
}
