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
}
