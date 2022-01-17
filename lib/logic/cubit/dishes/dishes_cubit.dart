import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dishes_state.dart';

class DishesCubit extends Cubit<DishesState> {
  DishesCubit() : super(DishesInitial());
}
