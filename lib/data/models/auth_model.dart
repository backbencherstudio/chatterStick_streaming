class AuthModel {
  final bool isLoading;
  final bool isObscure;
  final bool isLoginObscure;
  final bool isCreateNewObscure;
  final bool isCreateReObscure;
  final bool isCurrentObscure;
  final bool isNewObscure;

  AuthModel({
    required this.isLoading,
    required this.isObscure,
    required this.isLoginObscure,
    required this.isCreateNewObscure,
    required this.isCreateReObscure,
    required this.isCurrentObscure,
    required this.isNewObscure,
  });
  AuthModel copyWith({
    bool? isLoading,
    bool? isObscure,
    bool? isLoginObscure,
    bool? isCreateNewObscure,
    bool? isCreateReObscure,
    bool? isCurrentObscure,
    bool? isNewObscure,
  }) {
    return AuthModel(
      isLoading: isLoading ?? this.isLoading,
      isObscure: isObscure ?? this.isObscure,
      isLoginObscure: isLoginObscure ?? this.isLoginObscure,
      isCreateNewObscure: isCreateNewObscure ?? this.isCreateNewObscure,
      isCreateReObscure: isCreateReObscure ?? this.isCreateReObscure,
      isCurrentObscure: isCurrentObscure ?? this.isCurrentObscure,
      isNewObscure: isNewObscure ?? this.isNewObscure,
    );
  }
}
