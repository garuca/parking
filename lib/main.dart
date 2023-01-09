import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:parking/app_widget.dart';
import 'package:parking/features/list/domain/use_cases/parking_lots_list.dart';
import 'package:parking/features/list/presenter/list_cubit.dart';

void main() {
  final sl = GetIt.I;
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ListCubit>(
        create: (BuildContext context) => ListCubit(sl<ParkingBlocksList>()),
      ),
    ],
    child: const AppWidget(),
  ));
}
