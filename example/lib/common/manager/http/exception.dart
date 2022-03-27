import 'dart:io';

import 'package:dio/dio.dart';

class HttpException implements Exception {
  /// 错误信息
  final String? _message;

  String get message => _message ?? this.runtimeType.toString();

  final int? _code;

  int get code => _code ?? -1;

  HttpException([this._message, this._code]);

  String toString() {
    return "code:$code--message=$message";
  }

  static HttpException parseException(Exception error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return NetworkException(message: error.message);
        case DioErrorType.cancel:
          return CancelException(error.message);
        case DioErrorType.response:
          try {
            int? errCode = error.response?.statusCode;
            switch (errCode) {
              case 400:
                return BadRequestException(message: "请求语法错误", code: errCode);
              case 401:
                return UnauthorisedException(message: "没有权限", code: errCode);
              case 403:
                return BadRequestException(message: "服务器拒绝执行", code: errCode);
              case 404:
                return BadRequestException(message: "无法连接服务器", code: errCode);
              case 405:
                return BadRequestException(message: "请求方法被禁止", code: errCode);
              case 500:
                return BadServiceException(message: "服务器内部错误", code: errCode);
              case 502:
                return BadServiceException(message: "无效的请求", code: errCode);
              case 503:
                return BadServiceException(message: "服务器挂了", code: errCode);
              case 505:
                return UnauthorisedException(message: "不支持HTTP协议请求", code: errCode);
              default:
                return UnknownException(error.message);
            }
          } on Exception catch (_) {
            return UnknownException(error.message);
          }

        case DioErrorType.other:
          if (error.error is SocketException) {
            return NetworkException(message: error.message);
          } else {
            return UnknownException(error.message);
          }
        default:
          return UnknownException(error.message);
      }
    } else {
      return UnknownException(error.toString());
    }
  }
}

/// 客户端请求错误
class BadRequestException extends HttpException {
  BadRequestException({String? message, int? code}) : super(message, code);
}

/// 服务端响应错误
class BadServiceException extends HttpException {
  BadServiceException({String? message, int? code}) : super(message, code);
}

class UnknownException extends HttpException {
  UnknownException([String? message]) : super(message);
}

class CancelException extends HttpException {
  CancelException([String? message]) : super(message);
}

class NetworkException extends HttpException {
  NetworkException({String? message, int? code}) : super(message, code);
}

/// 401
class UnauthorisedException extends HttpException {
  UnauthorisedException({String? message, int? code = 401}) : super(message);
}

class BadResponseException extends HttpException {
  // ignore: unnecessary_question_mark
  dynamic? data;

  BadResponseException([this.data]) : super();
}
