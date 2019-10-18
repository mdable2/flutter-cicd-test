class UserAuthentication{
  //TODO get Redirect URL
//https://www.didierboelens.com/2018/04/facebook-oauth-login-with-flutter---solution/
  
  String redirectUrl = "beerAnalyzer://redirect";
  String authUrl = 
    "https://untappd.com/oauth/authenticate/?client_id=CLIENTID&response_type=code&redirect_url=";
  
  Future<String> authenticate() async {
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    return false;
  }
}