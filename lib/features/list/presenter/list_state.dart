import 'package:parking/features/list/domain/entities/parking_block.dart';
import 'package:parking/features/list/domain/errors/errors.dart';

abstract class ListState {}

class StartState implements ListState {
  const StartState();
}

class LoadingState implements ListState {
  const LoadingState();
}

class ErrorState implements ListState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements ListState {
  final List<ParkingBlock>? list;
  const SuccessState(this.list);
}
