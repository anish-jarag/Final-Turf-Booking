import 'package:myapp/models/time_slot_model.dart';

class Turf {
  final String id;
  final String name;
  final String address;
  final int phoneNumber;
  final String imgurl;
  final List<TimeSlot> timeSlots;

  Turf({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.imgurl,
    required this.timeSlots,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'images': imgurl,
      'timeSlots': timeSlots.map((timeSlot) => timeSlot.toMap()).toList(),
    };
  }

  factory Turf.fromMap(Map<String, dynamic> data) {
    return Turf(
      name: data['name'] ?? '',
      id: data['id'] ?? '',
      address: data['address'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      imgurl: data['imgurl'] ?? '',
      timeSlots: [] ,
    );
  }
}
