import 'package:case_study_app/models/language/language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState());

  void changeLanguage(Language selectedLanguage) {
    emit(state.copyWith(selectedLanguage: selectedLanguage));
  }
}
