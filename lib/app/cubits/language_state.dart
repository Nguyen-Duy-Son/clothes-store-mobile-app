import 'dart:ui';

import 'package:equatable/equatable.dart';

class LanguageState extends Equatable {
  final Locale locale;

  LanguageState(this.locale);

  @override
  List<Object> get props => [locale];
}
class initialLanguageState extends LanguageState {
  initialLanguageState(Locale locale) : super(locale);
}