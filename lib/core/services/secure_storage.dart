//
//  pingbox
//  secure_storage.dart
//
//  Created by Ngonidzashe Mangudya on 1/21/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class SecureStorageService {
  static SecureStorageService? _instance;
  static FlutterSecureStorage? _storage;

  @factoryMethod
  static Future<SecureStorageService> getInstance() async {
    _instance ??= SecureStorageService();

    _storage ??= const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
        resetOnError: true,
      ),
    );

    return _instance!;
  }

  Future<void> saveToDisk(String key, String content) async {
    log('SAVE (secure) -> key: $key');
    await _storage!.write(key: key, value: content);
  }

  Future<String?> getFromDisk(String key) async {
    final value = await _storage!.read(key: key);
    log('GET (secure) -> key: $key');
    return value;
  }

  Future<void> removeFromDisk(String key) async {
    await _storage!.delete(key: key);
    log('Removed $key from secure storage');
  }

  Future<void> clearDisk() async {
    await _storage!.deleteAll();
    log('Cleared secure storage');
  }
}
