import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'language_state.dart';
import 'package:clothes_store_mobile_app/app/datasource/local/storage.dart';
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(initialLanguageState(Locale('vi')));
  void changeLocale(Locale locale) {
    emit(LanguageState(locale));
    Storage.setLocaleLocal(locale.languageCode);
  }
}