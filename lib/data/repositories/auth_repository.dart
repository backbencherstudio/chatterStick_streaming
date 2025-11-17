import 'package:chatterstick_streaming_app/data/sources/remote/auth_api_service.dart';
import 'package:image_picker/image_picker.dart';


class AuthRepository {
  final AuthApiService remoteSource;
  AuthRepository({required this.remoteSource});
  Future<bool> register({required String device,required String email, required String password, required String name, required XFile image})async {
   return await remoteSource.register(
     email: email,
     password: password,
     name: name,
     image: image,
       device: device
   );
  }
    Future<bool> login({required String email ,required String password})async {
   return await remoteSource.login(email: email,password: password);
  }

  Future<bool> emailVerify({required String email,required String otp}){
    return remoteSource.emailVerify(email: email, otp: otp);
  }

  Future<bool> verifyToken({required String email,required String token}){
    return remoteSource.verifyToken(email: email, token: token);
  }

  Future<bool> forgotPassword({required String email}){
    return remoteSource.forgotPassword(email: email);
  }
  Future<bool> newPassword({required String email,required String password, required String otp}){
    return remoteSource.newPassword(email: email,password: password, token: otp);
  }
  
}
