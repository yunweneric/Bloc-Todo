import 'package:bloc_test/api/todo_api.dart';

class TodoRepository {
  final todo_api = TodoApi();
  repoAddTodo({required String todo}) {
    try {
      todo_api.addApiTodo(api_todo: todo);
    } catch (e) {
      return null;
    }
  }

  getTodos() {
    try {
      todo_api.getTodos();
    } catch (e) {
      return null;
    }
  }
}
