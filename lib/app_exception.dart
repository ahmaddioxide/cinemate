class AppException implements Exception {
  final String message;
  final String prefix;
  final String url;

  AppException({
    required this.message,
    required this.prefix,
    required this.url,
  });
}

class BadRequestException extends AppException {
  BadRequestException({
    required String? message,
   required String? url,
  }) : super(
    message: message ?? "Bad Request",
    prefix: 'Bad Request',
    url: url ?? "",
  );
}
class FetchDataException extends AppException {
  FetchDataException({
    String? message,
    String? url,
  }) : super(
    message: message ?? "",
    prefix: 'Unable to Process',
    url: url ?? "",
  );
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException({
    String? message,
    String? url,
  }) : super(
    message: message ?? "",
    prefix: 'Api Not Responding',
    url: url ?? "",
  );
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({
    String? message,
    String? url,
  }) : super(
    message: message ?? "",
    prefix: 'UnAuthorized Request',
    url: url ?? "",
  );
}