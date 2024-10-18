import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datingapp/global.dart';
import 'package:datingapp/models/person.dart';
import 'package:datingapp/tabScreens/favorite_sent_receieved_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Profilecontroller extends GetxController {
  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);

  List<Person> get allUserProfileList => usersProfileList.value;

  @override
  void onInit() {
    super.onInit();

    usersProfileList.bindStream(FirebaseFirestore.instance
        .collection("users")
        .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((QuerySnapshot queryDataSnapshot) {
      List<Person> profilesList = [];

      // Debugging
      print('Number of profiles fetched: ${queryDataSnapshot.size}');
      if (queryDataSnapshot.size == 0) {
        print('No profiles found');
      }

      for (var eachProfile in queryDataSnapshot.docs) {
        print('Profile data: ${eachProfile.data()}');
        profilesList.add(Person.fromDataSnapshot(eachProfile));
      }

      return profilesList;
    }).handleError((error) {
      print('Error fetching profiles: $error');
    }));
  }

  // version 1, if click twice, it deletes
  // favoriteSentReceieved(String toUserID, String senderName) async {
  //   var document = await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(toUserID)
  //       .collection("favoriteReceived")
  //       .doc(currentUserID)
  //       .get();

  //   //remove the favorite from database
  //   if (document.exists) {
  //     //remove currentId from the favoriteReceieve List of that profile person [toUserID]
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(toUserID)
  //         .collection("favoriteReceived")
  //         .doc(currentUserID)
  //         .delete();

  //     //remove profile person [toUserID] from the favoriteReceieve List of the currentUser
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(currentUserID)
  //         .collection("favoriteSent")
  //         .doc(toUserID)
  //         .delete();
  //   } else
  //   // mark  as favorite // add favorite in database
  //   {
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(toUserID)
  //         .collection("favoriteReceived")
  //         .doc(currentUserID)
  //         .set({
  //       'senderName': senderName,
  //       'timestamp': FieldValue.serverTimestamp(),
  //     });

  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(currentUserID)
  //         .collection("favoriteSent")
  //         .doc(toUserID)
  //         .set({
  //       'senderName': senderName,
  //       'timestamp': FieldValue.serverTimestamp(),
  //     });
  //   }
  // }

  // version2 doesnt delete if click twice
  favoriteSentReceieved(String toUserID, String senderName) async {
    var document = await FirebaseFirestore.instance
        .collection("users")
        .doc(toUserID)
        .collection("favoriteReceived")
        .doc(currentUserID)
        .get();

    // Check if the favorite already exists
    if (!document.exists) {
      // Mark as favorite and add to the database
      await FirebaseFirestore.instance
          .collection("users")
          .doc(toUserID)
          .collection("favoriteReceived")
          .doc(currentUserID)
          .set({
        'senderName': senderName,
        'timestamp': FieldValue.serverTimestamp(),
      });

      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID)
          .collection("favoriteSent")
          .doc(toUserID)
          .set({
        'senderName': senderName,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
    // If the document exists, do nothing (or provide feedback if desired)
  }

// ================================================================================
  LikeSentReceieved(String toUserID, String senderName) async {
    var document = await FirebaseFirestore.instance
        .collection("users")
        .doc(toUserID)
        .collection("LikeReceived")
        .doc(currentUserID)
        .get();

    // If the user has already liked, remove the like
    if (document.exists) {
      // Remove the like from `LikeReceived` of the target user
      await FirebaseFirestore.instance
          .collection("users")
          .doc(toUserID)
          .collection("LikeReceived")
          .doc(currentUserID)
          .delete();

      // Remove the like from `LikeSent` of the current user
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID)
          .collection("LikeSent")
          .doc(toUserID)
          .delete();
    } else {
      // Add like to the target user's `LikeReceived`
      await FirebaseFirestore.instance
          .collection("users")
          .doc(toUserID)
          .collection("LikeReceived")
          .doc(currentUserID)
          .set({
        'senderName': senderName,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Add like to the current user's `LikeSent`
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID)
          .collection("LikeSent")
          .doc(toUserID)
          .set({
        'senderName': senderName,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }
}
