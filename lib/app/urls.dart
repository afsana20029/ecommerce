class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const String signInUrl = '$_baseUrl/auth/login';
  static  String verifyOtpUrl(String email, String otp) => '$_baseUrl/auth/verify-otp/$email/$otp';
  static String readProfile = '$_baseUrl/auth/profile';
}
