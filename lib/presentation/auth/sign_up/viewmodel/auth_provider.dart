import 'package:flutter_riverpod/legacy.dart';

import '../../../../data/models/auth_model.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthModel>(
  (ref) => AuthNotifier(),
);

class AuthNotifier extends StateNotifier<AuthModel> {
  AuthNotifier() : super(AuthModel(isLoading: false, isObscure: true));
  void toggleObscure() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  void toggleLoading() {
    state = state.copyWith(isLoading: !state.isLoading);
  }
}
