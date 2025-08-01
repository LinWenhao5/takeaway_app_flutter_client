class DeleteFromCartResponse {
  final String message;

  DeleteFromCartResponse({required this.message});

  factory DeleteFromCartResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFromCartResponse(message: json['message']);
  }
}
