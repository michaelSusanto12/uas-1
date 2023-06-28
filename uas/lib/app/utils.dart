import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'state/app_state.dart';


extension Snackbar on BuildContext {
  void removeAndShowSnackbar(final String message) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}


extension ProviderX on BuildContext {
  AppState get appState => read<AppState>();
}
