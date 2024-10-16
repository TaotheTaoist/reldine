import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoriteSentReceievedScreen extends StatefulWidget {
  const FavoriteSentReceievedScreen({super.key});

  @override
  State<FavoriteSentReceievedScreen> createState() =>
      _FavoriteSentReceievedScreenState();
}

class _FavoriteSentReceievedScreenState
    extends State<FavoriteSentReceievedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Static title without the userName
        title: Text("Home Screen"),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
          )
        ],
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
                FirebaseAuth.instance.signOut();
              },
              child: Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
