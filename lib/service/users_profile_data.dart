// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserProfileService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> saveUserProfile(String userId, Map<String, dynamic> data) async {
//     try {
//       await _firestore
//           .collection('user_profiles')
//           .doc(userId)
//           .set(data, SetOptions(merge: true));
//     } catch (e) {
//       print("Error saving user profile data: $e");
//       rethrow;
//     }
//   }

//   static getUserProfile(String uid) {}
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Save user profile data to Firestore
  Future<void> saveUserProfile(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore
          .collection('user_profiles')
          .doc(userId)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      print("Error saving user profile data: $e");
      rethrow;
    }
  }

  /// Fetch user profile data from Firestore
  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('user_profiles').doc(userId).get();

      if (snapshot.exists) {
        return snapshot.data();
      } else {
        print("User profile does not exist for ID: $userId");
        return null;
      }
    } catch (e) {
      print("Error fetching user profile data: $e");
      rethrow;
    }
  }
}
