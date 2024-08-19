part of 'language_cubit.dart';

class LanguageState {
  final Language selectedLanguage;

  const LanguageState({Language? selectedLanguage})
      : selectedLanguage = selectedLanguage ?? Language.english;

  LanguageState copyWith({Language? selectedLanguage}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LanguageState && other.selectedLanguage == selectedLanguage;
  }

  @override
  int get hashCode => selectedLanguage.hashCode;
}
