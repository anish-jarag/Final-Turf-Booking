class TimeSlot {
  final String id; 
  final DateTime startTime;
  final DateTime endTime;

  TimeSlot({
    required this.id,
    required this.startTime,
    required this.endTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory TimeSlot.fromMap(Map<String, dynamic> data) {
    return TimeSlot(
      id: data['id'],
      startTime: data['startTime'].toDate(),
      endTime: data['endTime'].toDate(),
    );
  }
}