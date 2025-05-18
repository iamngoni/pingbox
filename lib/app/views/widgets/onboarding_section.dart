//
//  pingbox
//  onboarding_section.dart
//
//  Created by Codecraft Solutions on 2025/05/17.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';

class OnboardingSection extends StatelessWidget {
  const OnboardingSection({
    required this.icon,
    required this.title,
    required this.description,
    required this.command,
    required this.response,
    super.key,
  });

  final IconData icon;
  final String title;
  final String description;
  final String command;
  final String response;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Container(
              padding: EdgeInsets.all(
                sx(32),
              ),
              decoration: const BoxDecoration(
                color: PingboxColors.lightNavyBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: PingboxColors.blueAccent,
                size: sy(60),
              ),
            ),
            SizedBox(height: sy(32)),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: PingboxColors.white,
                fontWeight: FontWeight.w900,
                fontSize: sy(12),
              ),
            ),
            SizedBox(
              height: sy(5),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: sy(10),
                color: Colors.grey[400],
              ),
            ),
            SizedBox(
              height: sy(32),
            ),
            Container(
              width: context.width,
              padding: EdgeInsets.all(sx(16)),
              decoration: BoxDecoration(
                color: PingboxColors.lightNavyBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sy(10),
                        fontFamily: 'IBM Plex Mono',
                      ),
                      children: [
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.terminal,
                            size: 16,
                            color: Colors.blueAccent,
                          ),
                        ),
                        TextSpan(text: ' $command'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sy(8),
                  ),
                  Text(
                    response,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: sy(10),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 3),
          ],
        );
      },
    );
  }
}
