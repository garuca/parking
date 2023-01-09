import 'package:dartz/dartz.dart';
import 'package:parking/features/list/data/data_source/parking_blocks_data_source.dart';
import 'package:parking/features/list/domain/entities/parking_block.dart';
import 'package:parking/features/list/domain/errors/errors.dart';
import 'package:parking/features/list/domain/repositories/parking_repository.dart';

class ParkingBlocksRepositoryImpl implements ParkingBlocksRepository {
  final ParkingBlocksSource dataSource;

  ParkingBlocksRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<ParkingBlock>?>> list() async {
    try {
      final result = await dataSource.getParkingBlocks();
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
