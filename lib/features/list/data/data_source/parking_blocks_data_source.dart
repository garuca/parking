import 'package:parking/features/list/domain/entities/parking_block.dart';

abstract class ParkingBlocksSource {
  Future<List<ParkingBlock>?> getParkingBlocks();
}
