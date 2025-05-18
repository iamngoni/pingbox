//
//  pingbox
//  landing.dart
//
//  Created by Ngonidzashe Mangudya on 2025/05/17.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/widgets/pingbox_button.dart';
import '../../../l10n/l10n.dart';
import '../widgets/language_onboarding_section.dart';
import '../widgets/onboarding_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController();
  final int totalPages = 4;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          backgroundColor: PingboxColors.navyBlue,
          body: SafeArea(
            child: Container(
              color: PingboxColors.navyBlue,
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
                vertical: sy(10),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      children: [
                        OnboardingSection(
                          icon: Icons.storage,
                          title: context.l10n.onboarding1Title,
                          description: context.l10n.onboarding1Description,
                          command: '> ping api.example.com',
                          response: '200 OK  -  Response time: 42ms',
                        ),
                        OnboardingSection(
                          icon: Icons.api,
                          title: context.l10n.onboarding2Title,
                          description: context.l10n.onboarding2Description,
                          command: '> curl -X GET api.example.com',
                          response: 'Response: {"status":"success"}',
                        ),
                        OnboardingSection(
                          icon: Icons.code,
                          title: context.l10n.onboarding3Title,
                          description: context.l10n.onboarding3Description,
                          command: '> npm install pingbox',
                          response: 'Installed successfully!',
                        ),
                        LanguageOnboardingSection(
                          icon: Icons.language,
                          title: context.l10n.onboarding4Title,
                          description: context.l10n.onboarding4Description,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: sy(16)),
                  if (currentPage == 3)
                    PingboxButton(
                      text: context.l10n.onboarding4Button,
                      onTap: () {
                        context.goTo(route: '/app');
                      },
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(totalPages, (i) {
                        final isCurrentPage = i == currentPage;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: sx(8)),
                          child: GestureDetector(
                            onTap: () {
                              setState(() => currentPage = i);
                              _pageController.animateToPage(
                                currentPage,
                                duration: 300.milliseconds,
                                curve: Curves.easeInOut,
                              );
                            },
                            child: AnimatedContainer(
                              duration: 300.milliseconds,
                              width: sx(16),
                              height: sx(16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    isCurrentPage ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
