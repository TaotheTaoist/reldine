// import 'package:datingapp/controller/profile-controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SwippingScreen extends StatefulWidget {
//   const SwippingScreen({super.key});

//   @override
//   State<SwippingScreen> createState() => _SwippingScreenState();
// }

// class _SwippingScreenState extends State<SwippingScreen> {
//   Profilecontroller profileController = Get.put(Profilecontroller());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() {
//         // Check if the profile list is not empty
//         if (profileController.allUserProfileList.isEmpty) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else {
//           return PageView.builder(
//             itemCount: profileController.allUserProfileList.length,
//             controller: PageController(initialPage: 0, viewportFraction: 1),
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               final eachProfileInfo =
//                   profileController.allUserProfileList[index];

//               return Stack(
//                 children: [
//                   // Display background profile image
//                   Positioned.fill(
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(
//                             eachProfileInfo.imageProfile ?? '',
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // You can add other widgets on top of the image here
//                   Positioned(
//                     bottom: 20,
//                     left: 20,
//                     child: Text(
//                       eachProfileInfo.name ?? 'Unknown User',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }
// import 'package:datingapp/controller/profile-controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class SwippingScreen extends StatefulWidget {
//   const SwippingScreen({super.key});

//   @override
//   State<SwippingScreen> createState() => _SwippingScreenState();
// }

// class _SwippingScreenState extends State<SwippingScreen> {
//   Profilecontroller profileController = Get.put(Profilecontroller());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() {
//         // Check if the profile list is not empty
//         if (profileController.allUserProfileList.isEmpty) {
//           print('No profiles found');
//           // Display this message when no profiles are found
//           return Center(
//             child: Text(
//               'No profiles found',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//             ),
//           );
//         } else {
//           // Display the PageView when profiles are available
//           return PageView.builder(
//             itemCount: profileController.allUserProfileList.length,
//             controller: PageController(initialPage: 0, viewportFraction: 1),
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               final eachProfileInfo =
//                   profileController.allUserProfileList[index];

//               return Stack(
//                 children: [
//                   // Display background profile image
//                   Positioned.fill(
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(
//                             eachProfileInfo.imageProfile ?? '',
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 40, right: 30),
//                       child: IconButton(
//                         onPressed: () {
//                           // Add your onPressed functionality here
//                         },
//                         icon: const Icon(
//                           Icons.filter_list,
//                           size: 30,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Dynamically position name, age, and city with GestureDetector
//                   Positioned(
//                     top: MediaQuery.of(context).size.height *
//                         0.70, // 15% from the top
//                     left: 0,
//                     right: 0, // Center horizontally
//                     child: GestureDetector(
//                       onTap: () {
//                         // Handle tap event here
//                       },
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             eachProfileInfo.name.toString(),
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 24,
//                               letterSpacing: 4,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "${eachProfileInfo.age} ⦾ ${eachProfileInfo.city}",
//                             style: TextStyle(
//                               fontSize: 14,
//                               letterSpacing: 4,
//                             ),
//                           ),
//                           SizedBox(
//                               height: 4), // Space between name and the buttons
//                           // ElevatedButtons in a Row
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment
//                                 .center, // Center the row horizontally
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () {},
//                                 style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(
//                                         18), // Rounded corners
//                                   ),
//                                   backgroundColor: Colors.white.withOpacity(
//                                       0.2), // Button background color
//                                   foregroundColor: Colors.black, // Text color
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 10),
//                                 ),
//                                 child: Text(
//                                   "${eachProfileInfo.age} ⦾ ${eachProfileInfo.city}",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     letterSpacing: 4,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                   width: 10), // Space between the two buttons
//                               ElevatedButton(
//                                 onPressed: () {},
//                                 style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(
//                                         18), // Rounded corners
//                                   ),
//                                   backgroundColor: Colors.white.withOpacity(
//                                       0.2), // Button background color
//                                   foregroundColor: Colors.black, // Text color
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 10),
//                                 ),
//                                 child: Text(
//                                   "${eachProfileInfo.religion}",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     letterSpacing: 4,
//                                   ),
//                                 ),
//                               ),

//                             ],

//                           ),

//                         ],
//                       ),
//                     ),
//                   ),

//                 ],
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:datingapp/controller/profile-controller.dart';

// class SwippingScreen extends StatefulWidget {
//   const SwippingScreen({super.key});

//   @override
//   State<SwippingScreen> createState() => _SwippingScreenState();
// }

// class _SwippingScreenState extends State<SwippingScreen> {
//   Profilecontroller profileController = Get.put(Profilecontroller());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() {
//         if (profileController.allUserProfileList.isEmpty) {
//           print('No profiles found');
//           return Center(
//             child: Text(
//               'No profiles found',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//             ),
//           );
//         } else {
//           return PageView.builder(
//             itemCount: profileController.allUserProfileList.length,
//             controller: PageController(initialPage: 0, viewportFraction: 1),
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               final eachProfileInfo =
//                   profileController.allUserProfileList[index];

//               return Stack(
//                 children: [
//                   Positioned.fill(
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(
//                             eachProfileInfo.imageProfile ?? '',
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 40, right: 30),
//                       child: IconButton(
//                         onPressed: () {
//                           // Add your onPressed functionality here
//                         },
//                         icon: const Icon(
//                           Icons.filter_list,
//                           size: 30,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: MediaQuery.of(context).size.height * 0.70,
//                     left: 0,
//                     right: 0,
//                     child: GestureDetector(
//                       onTap: () {
//                         // Handle tap event here
//                       },
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             eachProfileInfo.name.toString(),
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 24,
//                               letterSpacing: 4,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                                 // shape: RoundedRectangleBorder(
//                                 //   borderRadius: BorderRadius.circular(18),
//                                 // ),
//                                 // backgroundColor: Colors.white.withOpacity(0.2),
//                                 // foregroundColor: Colors.black,
//                                 // padding: EdgeInsets.symmetric(
//                                 //     horizontal: 10, vertical: 10),
//                                 ),
//                             child: Text(
//                               "${eachProfileInfo.age} ⦾ ${eachProfileInfo.city}",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 letterSpacing: 4,
//                               ),
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(18),
//                               ),
//                               backgroundColor: Colors.white.withOpacity(0.2),
//                               foregroundColor: Colors.black,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                             ),
//                             child: Text(
//                               "${eachProfileInfo.religion}",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 letterSpacing: 4,
//                               ),
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(18),
//                               ),
//                               backgroundColor: Colors.white.withOpacity(0.2),
//                               foregroundColor: Colors.black,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                             ),
//                             child: Text(
//                               "${eachProfileInfo.religion}",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 letterSpacing: 4,
//                               ),
//                             ),
//                           ),
//                           // Row for favorite icons
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.favorite,
//                                 color: Colors.red,
//                                 size: 30,
//                               ),
//                               SizedBox(width: 10),
//                               Icon(
//                                 Icons.close,
//                                 color: Colors.red,
//                                 size: 30,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datingapp/controller/profile-controller.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  Profilecontroller profileController = Get.put(Profilecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        // Check if the profile list is empty
        if (profileController.allUserProfileList.isEmpty) {
          print('No profiles found');
          return Center(
            child: Text(
              'No profiles found',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          );
        } else {
          // Display the profiles in a PageView
          return PageView.builder(
            itemCount: profileController.allUserProfileList.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final eachProfileInfo =
                  profileController.allUserProfileList[index];

              return Stack(
                children: [
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            eachProfileInfo.imageProfile ?? '',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 40, right: 30),
                      child: IconButton(
                        onPressed: () {
                          // Add your onPressed functionality here
                        },
                        icon: const Icon(
                          Icons.filter_list,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.70,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Handle tap event here
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            eachProfileInfo.name.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              letterSpacing: 4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(18),
                                // ),
                                // backgroundColor: Colors.white.withOpacity(0.2),
                                // foregroundColor: Colors.black,
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: 10, vertical: 10),
                                ),
                            child: Text(
                              "${eachProfileInfo.age} ⦾ ${eachProfileInfo.city}",
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 4,
                              ),
                            ),
                          ),
                          SizedBox(height: 10), // Spacing between buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.2),
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                ),
                                child: Text(
                                  "${eachProfileInfo.religion}", // Replace with actual text if needed
                                  style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 4,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10), // Spacing between buttons
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.2),
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                ),
                                child: Text(
                                  "${eachProfileInfo.religion}", // Replace with actual text if needed
                                  style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: 10), // Spacing between buttons and icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Action for the favorite icon
                                  print('Favorite icon tapped!');
                                },
                                style: ElevatedButton.styleFrom(
                                  shape:
                                      CircleBorder(), // Makes the button circular
                                  padding:
                                      EdgeInsets.all(10), // Add some padding
                                  backgroundColor: Colors
                                      .transparent, // Transparent background
                                  shadowColor:
                                      Colors.transparent, // Remove shadow
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  // Action for the chat icon
                                  print('Chat icon tapped!');
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(10),
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Icon(
                                  Icons.chat,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  // Action for the close icon
                                  print('Close icon tapped!');
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(10),
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      }),
    );
  }
}
