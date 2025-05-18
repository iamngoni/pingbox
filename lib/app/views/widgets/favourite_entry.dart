//
//  pingbox
//  favourite_entry.dart
//
//  Created by Ngonidzashe Mangudya on 2025/05/18.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';

class FavoriteEntry extends StatelessWidget {
  const FavoriteEntry({
    required this.label,
    required this.ok,
    super.key,
  });

  final String label;
  final bool ok;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: sx(15),
            horizontal: sx(20),
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: PingboxColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(8),
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.circle,
                color: ok ? Colors.green : Colors.red,
                size: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
