import 'package:flutter/material.dart';

class LikeSentLikeRecievedScreen extends StatefulWidget {
  const LikeSentLikeRecievedScreen({super.key});

  @override
  State<LikeSentLikeRecievedScreen> createState() =>
      _LikeSentLikeRecievedScreenState();
}

class _LikeSentLikeRecievedScreenState
    extends State<LikeSentLikeRecievedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Static title without the userName
        title: Text("Home Screen"),
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
