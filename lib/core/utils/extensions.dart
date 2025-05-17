//
//  pingbox
//  extensions.dart
//
//  Created by Ngonidzashe Mangudya on 1/22/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';

import '../configs/colors.dart';

extension ContextExtensions<T> on BuildContext {
  Future<T?> goTo({required String route}) =>
      Navigator.of(this).pushNamed(route);

  Future<T?> goToAndReplace({required String route}) =>
      Navigator.of(this).pushReplacementNamed(route);

  Future<T?> goToAndRemoveUntil({required String route}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        route,
        (route) => false,
      );

  void goBack({dynamic value}) => Navigator.of(this).pop(value);

  // notify
  void notify(String message, {bool isError = false}) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              color: isError ? TycheColors.white : TycheColors.navyBlue,
              fontWeight: FontWeight.w500,
            ),
          ),
          duration: 3.seconds,
          backgroundColor: isError ? TycheColors.orange : TycheColors.white,
        ),
      );
}
