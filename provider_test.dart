import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<TodoNotifier>().AddTodo(Todo(data: 'Task 1', isDone: false));
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: context.watch<TodoNotifier>().getTodos.length,
          itemBuilder: ((context, index) {
            Todo todo = context.watch<TodoNotifier>().getTodos[index];
            return ListTile(
              leading: Checkbox(
                  value: todo.isDone,
                  onChanged: (ValueKey) {
                    context.read<TodoNotifier>().toggleDone(index);
                  }),
              title: Text(todo.data),
              trailing: IconButton(
                  onPressed: () {
                    context.read<TodoNotifier>().DeleteTodo(index);
                  },
                  icon: Icon(Icons.delete)),
            );
          }),
        ));
  }
}



class TodoNotifier with ChangeNotifier {
  List<Todo> todos = [];
  List<Todo> get getTodos => todos;

  AddTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  DeleteTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }

  toggleDone(int index) {
    todos[index].isDone = !todos[index].isDone;
    notifyListeners();
  }
}

class Todo {
  String data;
  bool isDone;
  Todo({
    required this.data,
    required this.isDone,
  });
}