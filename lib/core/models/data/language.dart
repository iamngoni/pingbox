//
//  pingbox
//  language.dart
//
//  Created by Ngonidzashe Mangudya on 1/21/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

enum Language {
  english('English', 'en'),
  afrikaans('Afrikaans', 'af'),
  german('German', 'de'),
  french('French', 'fr'),
  spanish('Spanish', 'es'),
  italian('Italian', 'it'),
  russian('Russian', 'ru'),
  portuguese('Portuguese', 'pt'),
  dutch('Dutch', 'nl'),
  norwegian('Norwegian', 'no'),
  swedish('Swedish', 'sv'),
  finnish('Finnish', 'fi'),
  unspecified('Unspecified', ''),
  chineseSimplified('Chinese (Simplified)', 'zh'),
  japanese('Japanese', 'ja'),
  greek('Greek', 'el'),
  turkish('Turkish', 'tr'),
  hebrew('Hebrew', 'he'),
  egyptian('Egyptian', 'eg'),
  flemish('Flemish', 'nl'), // Variant of Dutch
  hungarian('Hungarian', 'hu'),
  arabic('Arabic', 'ar'),
  polish('Polish', 'pl'),
  croatian('Croatian', 'hr'),
  maltese('Maltese', 'mt'),
  slovak('Slovak', 'sk'),
  czech('Czech', 'cs'),
  bulgarian('Bulgarian', 'bg'),
  danish('Danish', 'da'),
  serbian('Serbian', 'sr'),
  romanian('Romanian', 'ro'),
  ukrainian('Ukrainian', 'uk'),
  bosnian('Bosnian', 'bs'),
  macedonian('Macedonian', 'mk'),
  slovenian('Slovenian', 'sl'),
  faroese('Faroese', 'fo'),
  albanian('Albanian', 'sq'),
  belarusian('Belarusian', 'be'),
  estonian('Estonian', 'et'),
  icelandic('Icelandic', 'is'),
  lithuanian('Lithuanian', 'lt'),
  catalan('Catalan', 'ca'),
  latvian('Latvian', 'lv'),
  luxembourgish('Luxembourgish', 'lb'),
  montenegrin('Montenegrin', 'cnr'), // No official ISO 639-1 code
  swahili('Swahili', 'sw'),
  thai('Thai', 'th'),
  taiwanese('Taiwanese', 'zh'), // Variant of Chinese
  mandarin('Mandarin', 'zh'), // Variant of Chinese
  persian('Persian', 'fa'),
  korean('Korean', 'ko'),
  hindi('Hindi', 'hi'),
  indonesian('Indonesian', 'id'),
  malay('Malay', 'ms'),
  samoan('Samoan', 'sm'),
  tswana('Tswana', 'tn'),
  vietnamese('Vietnamese', 'vi'),
  burmese('Burmese', 'my'),
  zulu('Zulu', 'zu'),
  xhosa('Xhosa', 'xh'),
  sesotho('Sesotho', 'st'),
  tsonga('Tsonga', 'ts'),
  swati('Swati', 'ss'),
  venda('Venda', 've'),
  northNdebele('North Ndebele', 'nd'),
  southNdebele('South Ndebele', 'nr'),
  tigrinya('Tigrinya', 'ti'),
  englishUS('English (US)', 'en'),
  englishUK('English (UK)', 'en'),
  unknown('Unknown', '');

  const Language(this.name, this.code);
  final String name;
  final String code;

  bool get isSupportedByFlutter =>
      GlobalMaterialLocalizations.delegate.isSupported(Locale(code));

  @override
  String toString() => name;
}
