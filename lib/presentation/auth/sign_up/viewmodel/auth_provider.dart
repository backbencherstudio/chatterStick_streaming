import 'package:flutter_riverpod/legacy.dart';

import '../../../../data/models/auth_model.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthModel>(
  (ref) => AuthNotifier(),
);

class AuthNotifier extends StateNotifier<AuthModel> {
  AuthNotifier()
    : super(
        AuthModel(
          isLoading: false,
          isObscure: true,
          isLoginObscure: true,
          isCreateNewObscure: true,
          isCreateReObscure: true,
        ),
      );
  void toggleObscure() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  void toggleLoginObscure() {
    state = state.copyWith(isLoginObscure: !state.isLoginObscure);
  }
  void toggleCreateNewObscure() {
    state = state.copyWith(isCreateNewObscure: !state.isCreateNewObscure);
  }
  void toggleCreateReObscure() {
    state = state.copyWith(isCreateReObscure: !state.isCreateReObscure);
  }

  void toggleLoading() {
    state = state.copyWith(isLoading: !state.isLoading);
  }
}
