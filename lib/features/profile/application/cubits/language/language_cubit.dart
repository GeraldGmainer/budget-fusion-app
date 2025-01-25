import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'language_cubit.freezed.dart';
part 'language_state.dart';

@injectable
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState.initial());

  Future<void> load(Locale locale) async {
    emit(LanguageState.loaded(locale));
  }

  Future<void> set(Locale locale) async {
    emit(LanguageState.loaded(locale));
  }
}
