import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World',
      home: RecipeBook(),
    );
  }
}

class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Recipe Book', style: TextStyle(color: Colors.white)),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 125,
        child: Card(
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 125,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(),
                ),
              ),
              SizedBox(width: 26),
              Column(
                children: <Widget>[
                  Text('Lasagna'),
                  Text('Ricky Cortes'),
                  Container(height: 2, width: 75, color: Colors.indigo),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
