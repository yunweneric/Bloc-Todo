import 'package:bloc/bloc.dart';
import 'package:bloc_test/repo/todo_repo.dart';
import 'package:meta/meta.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial());
  final TodoRepository todo_repo = TodoRepository();

  void addTodo({required String todo}) {
    emit(AddingTodo());

    try {
      todo_repo.repoAddTodo(todo: todo).then((response) => {
            if (response != null)
              {emit(SuccessfullyAddedTodo(succesTodoResponse: response))}
            else
              emit(
                ErrorAddingTodo(),
              )
          });
    } catch (e) {
      emit(ErrorAddingTodo());
    }
  }

  void getTodos() {
    emit(GettingTodos());
    try {
      todo_repo.getTodos().then((response) => {
            if (response != null)
              {emit(SuccessfullyGotTodos(succesTodoResponse: response))}
            else
              emit(
                ErrorGettingTodos(),
              )
          });
    } catch (e) {
      emit(ErrorGettingTodos());
    }
  }
}
