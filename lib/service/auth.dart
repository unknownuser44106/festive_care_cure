// import 'package:festive_care_cure/home.dart';
// import 'package:festive_care_cure/service/database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthMethods {
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   // Get the current user
//   getCurrentUser() async {
//     return auth.currentUser;
//   }

//   // Sign in with Google
//   signInWithGoogle(BuildContext context) async {
//     final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//     final GoogleSignIn googleSignIn = GoogleSignIn();

//     // Google Sign-In process
//     final GoogleSignInAccount? googleSignInAccount =
//         await googleSignIn.signIn();

//     final GoogleSignInAuthentication? googleSignInAuthentication =
//         await googleSignInAccount?.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication?.idToken,
//         accessToken: googleSignInAuthentication?.accessToken);

//     // Sign in with Firebase
//     UserCredential result = await firebaseAuth.signInWithCredential(credential);

//     User? userDetails = result.user;

//     if (result.user != null) {
//       // Save user data to Firestore
//       Map<String, dynamic> userInfoMap = {
//         "email": userDetails!.email,
//         "name": userDetails.displayName,
//         "imgUrl": userDetails.photoURL,
//         "id": userDetails.uid
//       };
//       await DatabaseMethods()
//           .addUser(userDetails.uid, userInfoMap)
//           .then((value) {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => const HomeScreen()));
//       });
//     }
//     // Save user data to Firestore
//     Map<String, dynamic> userInfoMap = {
//       "email": userDetails!.email,
//       "name": userDetails.displayName,
//       "imgUrl": userDetails.photoURL,
//       "id": userDetails.uid
//     };
//     await DatabaseMethods().addUser(userDetails.uid, userInfoMap).then((value) {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const HomeScreen()));
//     });
//   }
// }

import 'package:festive_care_cure/home.dart';
import 'package:festive_care_cure/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      if (googleSignInAuthentication == null) return;

      // Sign in with Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      final UserCredential result =
          await _auth.signInWithCredential(credential);
      final User? userDetails = result.user;

      if (userDetails != null) {
        // Save user data to Firestore
        Map<String, dynamic> userInfoMap = {
          "email": userDetails.email,
          "name": userDetails.displayName,
          "imgUrl": userDetails.photoURL,
          "id": userDetails.uid
        };

        await DatabaseMethods()
            .addUser(userDetails.uid, userInfoMap)
            .then((value) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomeScreen(
                        userName: '',
                      )));
        });
      }
    } catch (e) {
      print('Error during Google sign-in: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with Google: $e"),
      ));
    }
  }
}
