import 'package:bloc_test/logic/cubit/todos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodosCubit, TodosState>(
      listener: (context, state) {
        if (state is GettingTodos) {
          print("User is getting todo");
        }
        if (state is ErrorGettingTodos) {
          print("User has error while getting todo");
        }
        if (state is SuccessfullyGotTodos) {
          print("User has Successfully getting todo");
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight(context) / 10),
                  Center(child: Text("My Todos")),
                  minorSpacer(context),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth(context) / 5),
                    child: TextFormField(
                      controller: todoController,
                      decoration: InputDecoration(
                        hintText: "Enter your todo",
                      ),
                    ),
                  ),
                  minorSpacer(context),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<TodosCubit>(context).addTodo(todo: todoController.text);
                    },
                    child: Text("Submit"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<TodosCubit>(context).getTodos();
                    },
                    child: Text("Get"),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  SizedBox minorSpacer(BuildContext context) => SizedBox(height: screenHeight(context) / 50);
  SizedBox majorSpacer(BuildContext context) => SizedBox(height: screenHeight(context) / 20);

  double screenHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  double screenWidth(context) {
    return MediaQuery.of(context).size.width;
  }
}
