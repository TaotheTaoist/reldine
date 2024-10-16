// import 'package:datingapp/authenticationScreen/registeration_screen.dart';
// import 'package:datingapp/controller/authenticationController.dart';
// import 'package:datingapp/widgets/custom_text_field_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController emailTextEditingController = TextEditingController();
//   TextEditingController passwordlTextEditingController =
//       TextEditingController();
//   var controllerAuth = Authenticationcontroller.authenticationcontroller;

//   bool showProgressBar = false; // Control for the progress bar

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               const SizedBox(height: 120),
//               Image.asset(
//                 "lib/image/logo.png",
//                 width: 180,
//               ),
//               const Text(
//                 "Welcome",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const Text(
//                 "Login",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: MediaQuery.of(context).size.width - 36,
//                 child: CustomTextFieldWidget(
//                   editingController: emailTextEditingController,
//                   labelText: "Email",
//                   iconData: Icons.email_outlined,
//                   isObscure: false,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: MediaQuery.of(context).size.width - 36,
//                 child: CustomTextFieldWidget(
//                   editingController: passwordlTextEditingController,
//                   labelText: "Password",
//                   iconData: Icons.lock_outline,
//                   isObscure: true,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: MediaQuery.of(context).size.width - 36,
//                 height: 55,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(12),
//                   ),
//                 ),
//                 child: InkWell(
//                   onTap: () async {
//                     String email = emailTextEditingController.text.trim();
//                     String password = passwordlTextEditingController.text.trim();

//                     // Check if email and password are not empty before calling loginUser
//                     if (email.isNotEmpty && password.isNotEmpty) {
//                       setState(() {
//                         showProgressBar = true; // Show progress bar when login starts
//                       });

//                       // Try to log in the user
//                       try {
//                         await controllerAuth.loginUser(email, password);

//                         // Login successful
//                         setState(() {
//                           showProgressBar = false; // Hide progress bar when login is done
//                         });
//                       } catch (e) {
//                         // Handle login error
//                         setState(() {
//                           showProgressBar = false; // Hide progress bar if login fails
//                         });
//                         Get.snackbar("Error", "Login failed. Please try again.");
//                       }
//                     } else {
//                       Get.snackbar("Error", "Please enter both email and password");
//                     }
//                   },
//                   child: const Center(
//                     child: Text(
//                       "Login",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Don't have an account?",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.green,
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.to(RegisterationScreen());
//                     },
//                     child: const Text(
//                       "Create An Account",
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               showProgressBar
//                   ? const CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
//                     )
//                   : Container(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:datingapp/authenticationScreen/registeration_screen.dart';
import 'package:datingapp/controller/authenticationController.dart';
import 'package:datingapp/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  bool obscureText = true; // Controls whether to obscure the password text
  bool showProgressBar = false; // Controls the display of the progress bar
  var controllerAuth = Authenticationcontroller.authenticationcontroller;

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
                style: TextStyle(
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
              // Email Input Field
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
              // Password Input Field with Toggle Visibility
              Container(
                width: MediaQuery.of(context).size.width - 36,
                child: TextField(
                  controller: passwordTextEditingController,
                  obscureText: obscureText, // Toggles password visibility
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText; // Toggle visibility
                        });
                      },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Login Button
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
                  onTap: () async {
                    String email = emailTextEditingController.text.trim();
                    String password = passwordTextEditingController.text.trim();

                    if (email.isNotEmpty && password.isNotEmpty) {
                      setState(() {
                        showProgressBar = true; // Show progress bar
                      });

                      try {
                        // Call the login function
                        await controllerAuth.loginUser(email, password);

                        setState(() {
                          showProgressBar =
                              false; // Hide progress bar after success
                        });
                      } catch (e) {
                        setState(() {
                          showProgressBar =
                              false; // Hide progress bar after error
                        });
                        Get.snackbar(
                            "Error", "Login failed. Please try again.");
                      }
                    } else {
                      Get.snackbar(
                          "Error", "Please enter both email and password");
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Display the progress bar if showProgressBar is true
              showProgressBar
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                    )
                  : Container(), // Empty container when progress bar is hidden
              const SizedBox(height: 10),
              // Sign-up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
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
                      "Create an account",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
