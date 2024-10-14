import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  // Optional: You can pass the user's name or any other info to the home screen
  HomeScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, $userName!"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to your HomeScreen!",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // You can add logout or other actions here
              },
              child: Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
