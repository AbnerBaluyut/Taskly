import 'package:flutter/material.dart';

class HomePage  extends StatelessWidget{
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Welcome to the Home Page!'),
          ],
        ),
      ),
    );
  }
}