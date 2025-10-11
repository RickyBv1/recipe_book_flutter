import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[_RecipeCard(context), _RecipeCard(context)],
      ),
    );
  }

  Widget _RecipeCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 125,
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                height: 125,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://www.tasteofhome.com/wp-content/uploads/2025/07/Best-Lasagna_EXPS_ATBBZ25_36333_DR_07_01_2b.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 26),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Lasagna',
                    style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                  ),
                  SizedBox(height: 4),
                  Container(height: 2, width: 75, color: Colors.indigo),
                  Text('Ricky Cortes', style: TextStyle(fontFamily: 'Roboto')),
                  SizedBox(height: 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
