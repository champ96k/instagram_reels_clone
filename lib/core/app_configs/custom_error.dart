import 'package:flutter/material.dart';

@immutable
class CustomError extends Error {
  final String? code;
  final String? message;

  CustomError({@required this.code, @required this.message});

  @override
  String toString() => 'HtpCustomError(message: $message)';

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CustomError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class NoInternetError extends CustomError {
  NoInternetError()
      : super(
          code: "NO_INTERNET",
          message: "Unable to connect to internet",
        );
}
