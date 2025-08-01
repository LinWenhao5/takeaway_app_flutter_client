class AvailableTimesResponse {
  final List<String> times;

  AvailableTimesResponse({required this.times});

  factory AvailableTimesResponse.fromJson(Map<String, dynamic> json) {
    return AvailableTimesResponse(
      times: (json['times'] as List).map((e) => e.toString()).toList(),
    );
  }
}
