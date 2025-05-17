//
//  pingbox
//  dio_error_to_application_error.dart
//
//  Created by Ngonidzashe Mangudya on 2025/01/26.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'dart:developer';

import 'package:dio/dio.dart';

import 'exceptions.dart';

ApplicationError dioErrorToApplicationError(DioException error) {
  late ApplicationError exception;
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Unable to connect',
      );
    case DioExceptionType.sendTimeout:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Unable to connect',
      );
    case DioExceptionType.receiveTimeout:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Unable to connect',
      );
    case DioExceptionType.badResponse:
      log('Bad Response: ${error.response}');
      if (error.response != null) {
        String? message;

        if (error.response?.data is Map<String, dynamic>) {
          // pick the first value in the map if it's a String
          // key, value where value is a string and key is not $id or $type
          message = error.response?.data.entries
              .firstWhere(
                (MapEntry<String, dynamic> entry) =>
                    entry.value is String &&
                    !entry.key.contains(r'$id') &&
                    !entry.key.contains(r'$type'),
                orElse: () => MapEntry(
                    'message', 'Sorry app could not process your request'),
              )
              .value as String;
        } else if (error.response?.data is String) {
          message = error.response?.data as String;
        } else {
          message = 'Sorry app could not process your request';
        }

        try {
          exception = ApplicationError(
            message,
            title: 'Unable to process request',
          );
        } catch (_) {
          exception = ApplicationError(
            'Sorry app could not process your request',
            title: 'Unable to process request',
          );
        }
      } else {
        exception = ApplicationError(
          'Sorry app is unable to communicate with the remote resources at '
          'the moment, please check your internet connection 📡 and retry.',
          title: 'Unable to process request',
        );
      }

    case DioExceptionType.unknown:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Unable to connect',
      );
    case DioExceptionType.cancel:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Request was cancelled',
      );
    case DioExceptionType.badCertificate:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Unable to connect',
      );
    case DioExceptionType.connectionError:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Unable to connect',
      );
  }

  return exception;
}
