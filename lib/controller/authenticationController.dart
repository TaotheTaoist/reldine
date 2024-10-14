import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:datingapp/models/person.dart' as personModel;

class Authenticationcontroller extends GetxController {
  static Authenticationcontroller authenticationcontroller = Get.find();
  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;
  pickImageFileFromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      Get.snackbar(
          "Profile Image", "You have successfully picked your profile image.");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  captureImageromPhoneCamera() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      Get.snackbar(
          "Profile Image", "You have successfully picked your profile image.");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;

    String downloadUrlImage = await snapshot.ref.getDownloadURL();

    return downloadUrlImage;
  }

  creatNewUserAccount(
    File imageProfile,
    String email,
    String password,
    String name,
    String age,
    String photoNo,
    String city,
    String country,
    String profileHeading,
    String lookingforInaPartner,
    int publishedDateTime,
    String height,
    String
        weight, // Changed from "Weight" to "weight" to follow camelCase convention
    String bodyType,
    String drink,
    String smoke,
    String
        maritalStatus, // Corrected spelling from "martialStatus" to "maritalStatus"
    String haveChildren,
    String noChildren,
    String profession,
    String employmentStatus,
    String income,
    String livingSituation,
    String willingtoRelocate,
    String relationshipYouAreLookingFor,
    String nationality,
    String education,
    String language,
    String religion,
    String ethnicity,
  ) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String urlOfDownloadImage = await uploadImageToStorage(imageProfile);
      personModel.Person personInstance = personModel.Person(
        imageProfile: urlOfDownloadImage,
        email: email,
        password: password,
        name: name,
        photoNo: photoNo, // Assuming `photoNo` is already available
        age: age,
        city: city,
        country: country,
        profileHeading: profileHeading,
        lookingforInaPartner: lookingforInaPartner,
        publishedDateTime:
            DateTime.now().millisecondsSinceEpoch, // Save current timestamp
        height: height,
        weight: weight,
        bodyType: bodyType,
        drink: drink,
        smoke: smoke,
        maritalStatus: maritalStatus,
        haveChildren: haveChildren,
        noChildren: noChildren,
        profession: profession,
        employmentStatus: employmentStatus,
        income: income,
        livingSituation: livingSituation,
        willingtoRelocate: willingtoRelocate,
        relationshipYouAreLookingFor: relationshipYouAreLookingFor,
        nationality: nationality,
        education: education,
        language: language,
        religion: religion,
        ethnicity: ethnicity,
      );
      // await FirebaseFirestore.instance
      //   .collection('users')
      //   .doc(credential.user!.uid)
      //   .set(personInstance.toJson());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(personInstance.toJson());
    } catch (errorMsg) {
      Get.snackbar("title", ":$errorMsg");
    }
  }
}
