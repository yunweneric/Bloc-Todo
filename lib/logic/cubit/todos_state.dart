part of 'todos_cubit.dart';

@immutable
abstract class TodosState {}

class TodosInitial extends TodosState {}

class AddingTodo extends TodosState {}

class ErrorAddingTodo extends TodosState {}

class SuccessfullyAddedTodo extends TodosState {
  final dynamic succesTodoResponse;

  SuccessfullyAddedTodo({this.succesTodoResponse});
}

class GettingTodos extends TodosState {}

class ErrorGettingTodos extends TodosState {}

class SuccessfullyGotTodos extends TodosState {
  final dynamic succesTodoResponse;

  SuccessfullyGotTodos({this.succesTodoResponse});
}
