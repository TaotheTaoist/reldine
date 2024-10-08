import 'package:datingapp/authenticationScreen/registeration_screen.dart';
import 'package:datingapp/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordlTextEditingController =
      TextEditingController();

  bool showProgressBar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
              child: Column(
        children: [
          const SizedBox(height: 120),
          Image.asset(
            "lib/image/logo.png",
            width: 180,
          ),
          const Text(
            "Welcome",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
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
              isObscure: true,
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
                  Get.to(RegisterationScreen());
                },
                child: const Text(
                  "Create An account",
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
      ))),
    );
  }
}
