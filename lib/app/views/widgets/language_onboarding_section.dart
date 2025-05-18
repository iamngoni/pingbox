//
//  pingbox
//  language_onboarding_section.dart
//
//  Created by Ngonidzashe Mangudya on 2025/05/18.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/models/data/language.dart';
import '../../../core/state/locale/locale_bloc.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/widgets/pingbox_dropdown_button.dart';
import '../../../l10n/l10n.dart';

class LanguageOnboardingSection extends StatefulWidget {
  const LanguageOnboardingSection({
    required this.icon,
    required this.title,
    required this.description,
    super.key,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  State<LanguageOnboardingSection> createState() =>
      _LanguageOnboardingSectionState();
}

class _LanguageOnboardingSectionState extends State<LanguageOnboardingSection> {
  Language language = Language.english;

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
                widget.icon,
                color: PingboxColors.blueAccent,
                size: sy(60),
              ),
            ),
            SizedBox(height: sy(32)),
            Text(
              widget.title,
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
              widget.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: sy(10),
                color: Colors.grey[400],
              ),
            ),
            SizedBox(
              height: sy(20),
            ),
            PingboxDropdownButton(
              hint: context.l10n.onboardingLanguageHint,
              items: Language.values,
              value: language,
              onChanged: (v) {
                if (v != null) {
                  if (v.isSupportedByFlutter) {
                    language = v;
                    context.read<LocaleBloc>().add(SwitchLocale(v));
                  } else {
                    context.notify(
                      'Sorry, ${v.name} is not fully supported!',
                      isError: true,
                    );
                  }
                }
              },
            ),
            const Spacer(flex: 3),
          ],
        );
      },
    );
  }
}
