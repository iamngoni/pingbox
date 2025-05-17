//
//  pingbox
//  api_response.dart
//
//  Created by Ngonidzashe Mangudya on 2025/01/26.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class APIResponse with _$APIResponse {
  const factory APIResponse({
    required bool success,
    required String? message,
    required dynamic data,
  }) = _APIResponse;

  const APIResponse._();

  factory APIResponse.fromJson(Map<String, dynamic> json) =>
      _$APIResponseFromJson(json);
}
