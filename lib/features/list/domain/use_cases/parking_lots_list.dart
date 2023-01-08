import 'package:dartz/dartz.dart';
import 'package:parking/features/list/domain/entities/parking_block.dart';
import 'package:parking/features/list/domain/errors/errors.dart';
import 'package:parking/features/list/domain/repositories/parking_repository.dart';

abstract class ParkingBlocksList {
  Future<Either<Failure, List<ParkingBlock>?>> call();
}

class ParkingBlocksListImpl implements ParkingBlocksList {
  final ParkingBlocksRepository repository;

  ParkingBlocksListImpl(this.repository);

  @override
  Future<Either<Failure, List<ParkingBlock>?>> call() async {
    return repository.list();
  }
}
