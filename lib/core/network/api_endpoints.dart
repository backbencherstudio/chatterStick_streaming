class ApiEndpoints {
  //auth
  static const String baseUrl = "http://192.168.4.13:8080/api";
  static const String register = 'auth/register';
  static const String login = 'auth/login';
  static const String verifyMail = 'auth/verify-email';
  static const String forgotPassword = 'auth/forgot-password';
  static const String changePassword = 'auth/change-password';
  static const String updateProfile = 'auth/update-profile';
  static const String me = 'auth/me';
  //profile
  static const String lastRead = 'profile/last-reads';
  static const String getMyIdea = 'profile/my-ideas';
  static const String createIdea = 'profile/create-idea';
  //comics
  static const String singleEpisode = 'comics/episode';
  static const String popularList = 'comics/popular-list';
  static const String library = 'comics/';
  static const String singleComics = 'comics/';
  static const String popularComics = 'comics/popular';
  //favorite
  static const String favorite = 'favorite';
  //download
  static const String download = 'download';






}
