import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parking/features/list/domain/entities/parking_block.dart';

class ParkingBlockModel implements ParkingBlock {
  @override
  String? id;
  @override
  Map? spaces;

  ParkingBlockModel({
    this.id,
    this.spaces,
  });

  ParkingBlockModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    spaces = json['spots'];
  }
  ParkingBlockModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot queryDocumentSnapshot) {
    id = queryDocumentSnapshot.id;
    spaces = queryDocumentSnapshot['spots'];
  }
}
