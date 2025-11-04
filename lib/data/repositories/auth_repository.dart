import 'package:chatterstick_streaming_app/data/sources/remote/auth_api_service.dart';
import 'package:image_picker/image_picker.dart';

class AuthRepository {
  final AuthApiService remoteSource;
  AuthRepository({required this.remoteSource});
  Future<bool> register({required String email, required String password, required String name, required XFile image})async {
   return await remoteSource.register(
     email: email,
     password: password,
     name: name,
     image: image
   );
  }
    Future<bool> login({required String email ,required String password})async {
   return await remoteSource.login(email: email,password: password);
  }

  Future<bool> emailVerify({required String email,required String otp}){
    return remoteSource.emailVerify(email: email, otp: otp);

  }
}
