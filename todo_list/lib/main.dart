import 'package:flutter/material.dart';
import 'package:flutter/uuid.dart';
import 'package:uuid/uuid.dart';

import './task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Task> tasks = [];
  final TextEditingController _todoController = TextEditingController();
  final _uuid = Uuid();

  void _addTask(String title) {
    if (title.isEmpty) {
      return;
    }
    setState(() {
      tasks.add(Task(id: _uuid.v4(), title: title));
    });
    _todoController.clear();
  }

  void _toggleTask(String id) {
    setState(() {
      final task = tasks.firstWhere((t) => t.id == id);
      task.isDone = !task.isDone;
    });
  }

  void _deleteTask(String id) {
    setState(() {
      tasks.removeWhere((t) => t.id == id);
    });
  }

  void _editTask(String id, String newTitle) {
    if (newTitle.isEmpty) {
      return;
    }
    setState(() {
      final task = tasks.firstWhere((t) => t.id == id);
      task.title = newTitle;
    });
  }

  void _showTaskDialog({String? taskId, String? currentTitle}) {
    if (currentTitle != null) {
      _todoController.text = currentTitle;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(taskId == null ? 'Add Task' : 'Edit Task'),
        content: TextField(
          controller: _todoController,
          decoration: const InputDecoration(hintText: 'Enter task title'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (taskId == null) {
                _addTask(_todoController.text);
              } else {
                _editTask(taskId, _todoController.text);
              }
              Navigator.pop(context)
            },
            child: Text(taskId == null ? 'Add' : 'Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
