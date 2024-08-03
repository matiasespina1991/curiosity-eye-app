class CurrentUserData {
  final String userId;
  final String? email;
  final bool isAnonymous;

  CurrentUserData(
      {required this.userId, this.email, required this.isAnonymous});
}
