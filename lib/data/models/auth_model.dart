class AuthModel {
  final bool isLoading;
  final bool isObscure;

  AuthModel({required this.isLoading, required this.isObscure});
  AuthModel copyWith({bool? isLoading, bool? isObscure}) {
    return AuthModel(
      isLoading: isLoading ?? this.isLoading,
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
