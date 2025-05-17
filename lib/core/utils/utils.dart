//
//  pingbox
//  utils.dart
//
//  Created by Ngonidzashe Mangudya on 2025/01/26.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import '../models/data/api_response.dart';

String? getErrorsFromAPIResponse(APIResponse response) {
  if (response.data is Map) {
    final data = response.data as Map;
    for (final value in data.values) {
      if (value is List && value.isNotEmpty) {
        return value.first as String;
      }
    }
  }
  return response.message;
}
