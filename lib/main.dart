import 'package:flutter/material.dart';
import 'package:todo_app/pages/home/home.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/page_model.dart';
import 'package:todo_app/models/todo_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'Todo App';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>TodoModel(),),
          ChangeNotifierProvider(create: (_)=>PageModel(),)
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage()//HomePage(title: this.title),
        )
    );
  }
}