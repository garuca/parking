import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:parking/features/list/domain/use_cases/parking_lots_list.dart';
import 'package:parking/features/list/presenter/list_state.dart';

class ListCubit extends Cubit<ListState> {
  final ParkingBlocksList? parkingBlocksList;

  ListCubit(this.parkingBlocksList) : super(const StartState()) {
    execute();
  }

  Future<ListState> execute() async {
    final response = await parkingBlocksList!();
    final result = response.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
    emit(result);
    return result;
  }
}
