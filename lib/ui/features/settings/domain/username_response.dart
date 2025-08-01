class UsernameResponse {
  final String username;

  UsernameResponse({required this.username});

  factory UsernameResponse.fromJson(Map<String, dynamic> json) {
    return UsernameResponse(username: json['username'] as String);
  }
}
