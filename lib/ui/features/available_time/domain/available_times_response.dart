class AvailableTimesResponse {
  final bool success;
  final String date;
  final List<String> times;

  AvailableTimesResponse({
    required this.success,
    required this.date,
    required this.times,
  });

  factory AvailableTimesResponse.fromJson(Map<String, dynamic> json) {
    return AvailableTimesResponse(
      success: json['success'] ?? true,
      date: json['date'] ?? '',
      times: (json['times'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }
}