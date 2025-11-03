class AuthModel {
  final bool isLoading;
  final bool isObscure;
  final bool isLoginObscure;
  final bool isCreateNewObscure;
  final bool isCreateReObscure;

  AuthModel({
    required this.isLoading,
    required this.isObscure,
    required this.isLoginObscure,
    required this.isCreateNewObscure,
    required this.isCreateReObscure,
  });
  AuthModel copyWith({
    bool? isLoading,
    bool? isObscure,
    bool? isLoginObscure,
    bool? isCreateNewObscure,
    bool? isCreateReObscure,
  }) {
    return AuthModel(
      isLoading: isLoading ?? this.isLoading,
      isObscure: isObscure ?? this.isObscure,
      isLoginObscure: isLoginObscure ?? this.isLoginObscure,
      isCreateNewObscure: isCreateNewObscure ?? this.isCreateNewObscure,
      isCreateReObscure: isCreateReObscure ?? this.isCreateReObscure,
    );
  }
}
