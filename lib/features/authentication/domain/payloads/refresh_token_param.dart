class RefreshTokenParam {

  final String refreshToken;

  RefreshTokenParam({
    required this.refreshToken
  });

  toJson() => {
    'refresh': refreshToken
  };
}