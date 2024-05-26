import 'package:flutter/material.dart';
import 'package:todo_app/todo_screen.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo',
      home: const TodoScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff56B359),
          foregroundColor: Colors.white
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),

            )
          )
        )
      ),

    );
  }
}
