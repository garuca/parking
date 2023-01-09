import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'package:parking/features/list/data/data_source/parking_blocks_data_source.dart';
import 'package:parking/features/list/data/data_source/parking_blocks_data_source_impl.dart';
import 'package:parking/features/list/data/repositories/parking_blocks_repository_impl.dart';
import 'package:parking/features/list/domain/entities/parking_block.dart';
import 'package:parking/features/list/domain/repositories/parking_repository.dart';
import 'package:parking/features/list/domain/use_cases/parking_lots_list.dart';
import 'package:parking/features/list/presenter/list_cubit.dart';

final sl = GetIt.I;

startModule([CollectionReference? taskCollection]) {
  sl.registerFactory<ParkingBlocksList>(
      () => ParkingBlocksListImpl(sl<ParkingBlocksRepository>()));
  sl.registerFactory<ParkingBlocksRepository>(
      () => ParkingBlocksRepositoryImpl(sl<ParkingBlocksSource>()));
  sl.registerFactory<ParkingBlocksSource>(() => ParkingBlocksSourceImpl(sl()));
  sl.registerFactory(
      () => taskCollection ?? FirebaseFirestore.instance.collection('parking'));
  sl.registerLazySingleton(() => ListCubit(sl<ParkingBlocksList>()));
  sl.registerFactory<List<ParkingBlock>>(() => <ParkingBlock>[]);
}

disposeModule() {
  sl.get<ListCubit>().close();
  sl.unregister<ListCubit>();
}
