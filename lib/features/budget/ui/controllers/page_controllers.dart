import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class PageControllers {
  final PageController viewModeController;
  final PageController periodController;
  final _periodStreamController = StreamController<BookingPageViewData>.broadcast();

  Stream<BookingPageViewData> get stream => _periodStreamController.stream;

  void emit(BookingPageViewData data) {
    if (!_periodStreamController.isClosed) {
      _periodStreamController.sink.add(data);
    }
  }

  PageControllers({
    required this.viewModeController,
    required this.periodController,
  });

  void dispose() {
    viewModeController.dispose();
    periodController.dispose();
    _periodStreamController.close();
  }
}
