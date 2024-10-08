
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Authenticationcontroller extends GetxController{
  static Authenticationcontroller authenticationcontroller = Get.find();
  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;
  pickImageFileFromGallery() async {

     imageFile = await ImagePicker().pickImage(source:ImageSource.gallery);

    if(imageFile != null){

      Get.snackbar("Profile Image","You have successfully picked your profile image.");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }
  
  captureImageromPhoneCamera() async {
   imageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      Get.snackbar(
          "Profile Image", "You have successfully picked your profile image.");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }


}