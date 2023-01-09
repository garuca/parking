import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parking/features/list/data/data_source/parking_blocks_data_source.dart';
import 'package:parking/features/list/data/models/parking_block_model.dart';

class ParkingBlocksSourceImpl implements ParkingBlocksSource {
  final CollectionReference taskCollection;

  ParkingBlocksSourceImpl(this.taskCollection);

  @override
  Future<List<ParkingBlockModel>?> getParkingBlocks() async {
    final response = await taskCollection.get();
    return response.docs
        .map((e) => ParkingBlockModel.fromQueryDocumentSnapshot(e))
        .toList();
  }
}
