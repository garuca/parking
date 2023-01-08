import 'package:dartz/dartz.dart';
import 'package:parking/features/list/domain/entities/parking_block.dart';
import 'package:parking/features/list/domain/errors/errors.dart';

abstract class ParkingBlocksRepository {
  Future<Either<Failure, List<ParkingBlock>?>> list();
}
