import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'language_bloc.freezed.dart';
part 'language_event.dart';
part 'language_state.dart';

@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState.initial()) {
    on<LanguageEvent>((event, emit) async {
      await event.map(load: (event) => _onLoad(emit, event.context), set: (event) => _onSet(emit, event.locale));
    });
  }

  Future<void> _onLoad(Emitter<LanguageState> emit, BuildContext context) async {
    final locale = Localizations.localeOf(context);
    emit(LanguageState.loaded(locale));
  }

  Future<void> _onSet(Emitter<LanguageState> emit, Locale locale) async {
    emit(LanguageState.loaded(locale));
  }
}
