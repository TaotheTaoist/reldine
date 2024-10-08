import 'dart:io';

import 'package:datingapp/authenticationScreen/login_screen.dart';
import 'package:datingapp/controller/authenticationController.dart';
import 'package:datingapp/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {

  // personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordlTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController = TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController = TextEditingController();
  
  //Appearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weighteTextEditingController = TextEditingController();
  TextEditingController bodyTypeForInaPartnerTextEditingController =  TextEditingController();


  // LifyStyle
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController =
      TextEditingController();
  TextEditingController martialStatusTextEditingController = TextEditingController();
  TextEditingController haveChildrenTextEditingController = TextEditingController();
  TextEditingController noOfChildrenNoTextEditingController = TextEditingController();
  TextEditingController employmentStatusTextEditingController = TextEditingController();
  TextEditingController professionTextEditingController = TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController =
      TextEditingController();
  TextEditingController willingtoRelocateTextEditingController =
      TextEditingController();
      TextEditingController relationshipYouAreLookingForTextEditingController =
      TextEditingController();

    // LifyStyle
  TextEditingController nationalityTextEditingController = TextEditingController();
  TextEditingController educationTextEditingController = TextEditingController();
  TextEditingController lanaguageStatusTextEditingController =
      TextEditingController();
  TextEditingController religionTextEditingController =
      TextEditingController();
  TextEditingController ethnicityChildrenNoTextEditingController =
      TextEditingController();

  bool showProgressBar = false;

  var authenticationcontroller = Authenticationcontroller.authenticationcontroller;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body:SingleChildScrollView(
          child: Center(
            child:Column(
                children: [
                  const SizedBox(
                      height: 100,
                  ),
                  Text(
                    "Create Account",
                    style: TextStyle(fontSize: 22,
                    color: Colors.grey,
                    fontWeight:FontWeight.bold)
                  ),
                  SizedBox(
                    height: 10,
                  ),
                Text(
                  "to get Started Now.",
                  style:TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold)
                  
                ),
                   SizedBox(
                height: 10,
              ),

              //choose image circle avatar
              authenticationcontroller.imageFile == null?
             CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                      "lib/image/profileAvatar.png"
                    ),
                    backgroundColor: Colors.black,


                ) : Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: FileImage(File(
                        authenticationcontroller.imageFile!.path,
                      ),)
                    ),

                  ),

                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    IconButton(
                      onPressed: () async {

                        await authenticationcontroller.pickImageFileFromGallery();
                        setState(() {
                          authenticationcontroller.imageFile;
                        });
                      },
                       icon: Icon(Icons.image_outlined,
                       color: Colors.grey,
                       size: 30,
                       ),

                    ),
                     IconButton(
                      onPressed: () async {
                        await authenticationcontroller.captureImageromPhoneCamera();
                         setState(() {
                        authenticationcontroller.imageFile;
                      });
                      },
                       icon: Icon(Icons.camera_alt_outlined,
                       color: Colors.grey,
                       size: 30,
                       ),

                    )
                  ],

                ),
          
            SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width - 36,
                child: CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width - 36,
                child: CustomTextFieldWidget(
                  editingController: passwordlTextEditingController,
                  labelText: "Password",
                  iconData: Icons.lock_outline,
                  isObscure: false,
                ),
              ),
              
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width - 36,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: "Age",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
               Container(
                width: MediaQuery.of(context).size.width - 36,
                child: CustomTextFieldWidget(
                  editingController: phoneNoTextEditingController,
                  labelText: "Phone",
                  iconData: Icons.phone_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width - 36,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: "City",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
               Container(
                width: MediaQuery.of(context).size.width - 36,
                child: CustomTextFieldWidget(
                  editingController: profileHeadingTextEditingController,
                  labelText: "Profile Heading",
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width - 36,
                child: CustomTextFieldWidget(
                  editingController: lookingForInaPartnerTextEditingController,
                  labelText: "What are your looking for",
                  iconData: Icons.face,
                  isObscure: false,
                ),
              ),
              const Text("Appearance",
              style:TextStyle(
                color: Colors.white,
                fontSize:20,
                fontWeight: FontWeight.bold
              ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                    width: MediaQuery.of(context).size.width - 36,
                    height: 55,
                child: CustomTextFieldWidget(
                  editingController: heightTextEditingController,
                  labelText: "Height",
                  iconData: Icons.insert_chart,
                  isObscure: false,
                
              ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: weighteTextEditingController,
                  labelText: "Weight",
                  iconData: Icons.table_chart,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
               SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: drinkTextEditingController,
                  labelText: "Body Type",
                  iconData: Icons.type_specimen,
                  isObscure: false,
                ),
              ),
              const Text(
                "Life Style ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:drinkTextEditingController,
                  labelText: "Drink",
                  iconData: Icons.local_drink,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: smokeTextEditingController,
                  labelText: "Smoking",
                  iconData: Icons.smoking_rooms,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: martialStatusTextEditingController,
                  labelText: "Martial Status",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),
                const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: haveChildrenTextEditingController,
                  labelText: "No. Children",
                  iconData: CupertinoIcons.person_3_fill,
                  isObscure: false,
                ),
              ),
                 const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:  employmentStatusTextEditingController,
                  labelText: "Employment Status",
                  iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
                  isObscure: false,
                ),
              ),
                 const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:  professionTextEditingController,
                  labelText: "Profession",
                  iconData: Icons.business_center,
                  isObscure: false,
                ),
              ),
                 const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:  incomeTextEditingController,
                  labelText: "Income",
                  iconData: CupertinoIcons.money_dollar_circle,
                  isObscure: false,
                ),
              ),
               const SizedBox(height: 20),
                SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:  livingSituationTextEditingController,
                  labelText: "living Situation",
                  iconData: CupertinoIcons.person_2_square_stack,
                  isObscure: false,
                ),
              ),
               const SizedBox(height: 20),
                   SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:  willingtoRelocateTextEditingController,
                  labelText: "Willing to Relocate?",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),
               const SizedBox(height: 20),
                   SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController:  relationshipYouAreLookingForTextEditingController,
                  labelText: "What relationship you are looking for?",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),

              const Text(
                "Background",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: nationalityTextEditingController,
                  labelText: "Nationality",
                  iconData: Icons.flag_circle_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: educationTextEditingController,
                  labelText: "Education",
                  iconData: Icons.history_edu,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: lanaguageStatusTextEditingController,
                  labelText: "language",
                  iconData: CupertinoIcons.person_badge_plus_fill,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: religionTextEditingController,
                  labelText: "Religion",
                  iconData: CupertinoIcons.checkmark_seal_fill,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ethnicityChildrenNoTextEditingController,
                  labelText: "Ethincity",
                  iconData: CupertinoIcons.eye,
                  isObscure: false,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: InkWell(
                  onTap: () {},
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      "Already have an account",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 10),
              showProgressBar == true
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                    )
                  : Container(),
 
                ],
            ),


          ),

      ),
    );
  }
}