import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datingapp/global.dart';
import 'package:flutter/material.dart';

class LikeSentLikeRecievedScreen extends StatefulWidget {
  const LikeSentLikeRecievedScreen({Key? key}) : super(key: key);

  @override
  State<LikeSentLikeRecievedScreen> createState() =>
      _LikeSentLikeRecievedScreen();
}

class _LikeSentLikeRecievedScreen extends State<LikeSentLikeRecievedScreen> {
  List<String> likesReceivedList = [];
  List<String> likesSentList = [];
  List mutualLikesList = [];
  bool isLikesSentClick = true;

// Fetching mutual likes (both users like each other)
  getMutualLikesList() async {
    try {
      likesSentList.clear();
      likesReceivedList.clear();
      mutualLikesList.clear();
      print("Fetching mutual likes list for user: $currentUserID");

      // Fetch sent likes documents
      var likesSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID.toString())
          .collection("LikeSent")
          .get();

      print(
          "Likes Sent Fetch Result: ${likesSentDocument.docs.length} documents");

      if (likesSentDocument.docs.isEmpty) {
        print("No sent likes found for user: $currentUserID");
      }

      // Populate the likesSentList
      for (var doc in likesSentDocument.docs) {
        likesSentList.add(doc.id);
      }

      // Fetch received likes documents
      var likesReceivedDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID.toString())
          .collection("LikeReceived")
          .get();

      print(
          "Likes Received Fetch Result: ${likesReceivedDocument.docs.length} documents");

      if (likesReceivedDocument.docs.isEmpty) {
        print("No received likes found for user: $currentUserID");
      }

      // Populate the likesReceivedList
      for (var doc in likesReceivedDocument.docs) {
        likesReceivedList.add(doc.id);
      }

      print("Sent Likes List: $likesSentList");
      print("Received Likes List: $likesReceivedList");

      // Find mutual likes by intersecting both lists
      List<String> mutualLikesIDs = likesSentList
          .where((likedUser) => likesReceivedList.contains(likedUser))
          .toList();

      print("Mutual Likes IDs: $mutualLikesIDs");

      if (mutualLikesIDs.isEmpty) {
        print("No mutual likes found.");
      }

      // Fetch user data for mutual likes
      await getUsersFromLikes(mutualLikesIDs);

      // Refresh UI
      setState(() {
        print("UI refreshed with mutual likes.");
      });
    } catch (e) {
      print("Error fetching mutual likes list: $e");
    }
  }

// Fetch user data based on mutual likes list
  Future<void> getUsersFromLikes(List<String> mutualLikesIDs) async {
    try {
      mutualLikesList.clear(); // Clear previous data

      var allUsersDocument =
          await FirebaseFirestore.instance.collection("users").get();

      for (var userDoc in allUsersDocument.docs) {
        if (mutualLikesIDs.contains(userDoc.data()['uid'] as dynamic)) {
          mutualLikesList.add(userDoc.data());
        }
      }

      setState(() {
        mutualLikesList;
      });
    } catch (e) {
      print("Error fetching user data: $e");
    }
    print("Mutual Likes List: $mutualLikesList");
  }

  @override
  void initState() {
    super.initState();
    // Fetch the initial mutual likes list
    getMutualLikesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Matched",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true, // Center the title text
      ),
      body: mutualLikesList.isEmpty
          ? Center(
              child:
                  Icon(Icons.person_off_sharp, color: Colors.white, size: 60),
            )
          : GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8),
              children: List.generate(mutualLikesList.length, (Index) {
                return GridTile(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      color: Colors.blue.shade200,
                      child: GestureDetector(
                        onTap: () {
                          // Handle tap actions, like navigating to user's profile
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                mutualLikesList[Index]["imageProfile"],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    mutualLikesList[Index]["name"].toString() +
                                        " " +
                                        mutualLikesList[Index]["age"]
                                            .toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
    );
  }
}
