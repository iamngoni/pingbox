//
//  pingbox
//  exceptions.dart
//
//  Created by Ngonidzashe Mangudya on 2025/01/26.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

class ApplicationError implements Exception {
  ApplicationError(
    this.message, {
    this.title = "Hey, it's not your fault",
  });

  factory ApplicationError.unknownError() => ApplicationError(
        'An unknown error occurred',
      );

  final String message;
  final String title;
}
