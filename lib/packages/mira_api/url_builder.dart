
class UrlBuilder {
  UrlBuilder({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://backendwithdoc-hmdqjo3j.b4a.run/api';

  final String _baseUrl;
  static const String _baseUrlSecondPart = 'auth';


  String buildSignInUrl() {
    return '$_baseUrl/$_baseUrlSecondPart/login';
  }

  String buildSignUpUrl() {
    return '$_baseUrl/$_baseUrlSecondPart/register';
  }


}
