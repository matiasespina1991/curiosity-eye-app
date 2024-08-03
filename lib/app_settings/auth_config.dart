class AuthConfig {
  static const bool useProtectedRoutes = true;
  static const bool useFirebase = false;
  static const bool allowGoogleSignIn = true;
  //TODO: Add scope functionality:
  static const List<String> googleSignInScopes = ['email'];
  static const bool allowFacebookSignIn = false;
  static const bool allowAppleSignIn = false;
  static const bool allowAnonymousSignIn = false;
  static const bool allowEmailSignIn = false;
}
