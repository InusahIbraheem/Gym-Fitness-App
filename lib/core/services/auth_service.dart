class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  bool _isAuthenticated = false;
  bool _onboardingComplete = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get onboardingComplete => _onboardingComplete;

  void completeOnboarding() {
    _onboardingComplete = true;
  }

  Future<bool> signIn({required String email, required String password}) async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    if (email.isNotEmpty && password.length >= 6) {
      _isAuthenticated = true;
      return true;
    }
    return false;
  }

  void signOut() {
    _isAuthenticated = false;
  }
}
