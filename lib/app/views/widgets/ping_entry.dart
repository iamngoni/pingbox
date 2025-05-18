//
//  pingbox
//  ping_entry.dart
//
//  Created by Ngonidzashe Mangudya on 2025/05/18.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';

class PingEntry extends StatelessWidget {
  const PingEntry({
    required this.domain,
    required this.timeAgo,
    required this.latency,
    required this.ok,
    super.key,
  });

  final String domain;
  final String timeAgo;
  final String latency;
  final bool ok;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.symmetric(
            vertical: sx(15),
            horizontal: sx(20),
          ),
          decoration: BoxDecoration(
            color: PingboxColors.lightNavyBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    domain,
                    style: TextStyle(
                      color: PingboxColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: sy(8),
                    ),
                  ),
                  SizedBox(height: sy(4)),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.grey,
                        size: sy(8),
                      ),
                      SizedBox(
                        width: sx(5),
                      ),
                      Text(
                        timeAgo,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    latency,
                    style: TextStyle(
                      color: PingboxColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: sy(8),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    ok ? Icons.check_circle : Icons.cancel,
                    color: ok ? Colors.green : Colors.red,
                    size: sy(14),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
