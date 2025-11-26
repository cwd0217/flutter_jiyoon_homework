class Alarm {
  final String id;
  final String time;
  final bool isEnabled;

  Alarm({required this.id, required this.time, required this.isEnabled});

  Alarm copywith({
  String? id,
  String? time,
  bool? isEnabled,

  }) {
    return Alarm(id: id ?? this.id, time: time?? this.time, isEnabled: isEnabled ?? this.isEnabled);
  }
}
