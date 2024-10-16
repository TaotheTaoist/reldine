import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datingapp/models/person.dart';
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
}
