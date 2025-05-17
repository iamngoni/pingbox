//
//  pingbox
//  modal.dart
//
//  Created by Ngonidzashe Mangudya on 2025/01/26.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../configs/colors.dart';

Future<T?> $showModal<T>(
  BuildContext context, {
  Widget? child,
  double? maxHeight,
}) async {
  if (Platform.isIOS) {
    return _showCupertinoModal(
      context,
      child: child,
      maxHeight: maxHeight,
    );
  } else {
    return _showMaterialModal(
      context,
      child: child,
      maxHeight: maxHeight,
    );
  }
}

SizedBox _buildSizedBox(
  BuildContext context,
  Widget? child,
  double? maxHeight,
) {
  return SizedBox(
    width: context.width,
    height: maxHeight ?? context.height,
    child: child,
  );
}

Future<T?> _showMaterialModal<T>(
  BuildContext context, {
  Widget? child,
  double? maxHeight,
}) async {
  return showMaterialModalBottomSheet<T>(
    context: context,
    barrierColor: TycheColors.white.withOpacity(0.3),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return _buildSizedBox(context, child, maxHeight);
    },
  );
}

Future<T?> _showCupertinoModal<T>(
  BuildContext context, {
  Widget? child,
  double? maxHeight,
}) async {
  return showCupertinoModalBottomSheet<T>(
    context: context,
    topRadius: const Radius.circular(20),
    barrierColor: TycheColors.white.withOpacity(0.3),
    builder: (context) {
      return Material(
        child: _buildSizedBox(
          context,
          child,
          maxHeight,
        ),
      );
    },
  );
}
