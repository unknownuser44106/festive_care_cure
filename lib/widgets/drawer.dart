import 'package:festive_care_cure/screens/contact_us.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:festive_care_cure/signup.dart';
import 'package:festive_care_cure/widgets/userProfileD.dart';
import 'package:festive_care_cure/screens/cart_page.dart';
import 'package:festive_care_cure/screens/orderpage.dart';

class AppDrawer extends StatelessWidget {
  final String userName;
  final void Function(String identifier) onSelectScreen;

  const AppDrawer(
      {super.key, required this.userName, required this.onSelectScreen});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 255, 128, 0),
                  const Color.fromARGB(255, 174, 132, 68),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/icons/prof_icon.jpg'),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    userName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade600),
          _buildListTile(
            context,
            icon: Icons.shopping_bag,
            title: 'Orders',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderPage()),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.account_circle,
            title: 'Profile',
            onTap: () {
              if (currentUser != null) {
                fetchUserName(currentUser.uid).then((userName) {
                  Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfilePage(
                        userId: currentUser.uid,
                        userName: userName,
                      ),
                    ),
                  );
                });
              } else {
                // ignore: avoid_print
                print("User is not logged in.");
              }
            },
          ),
          _buildListTile(
            context,
            icon: Icons.contact_mail,
            title: 'Contact Us',
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CustomerSupportPage()),
              );
            },
          ),
          const Spacer(),
          _buildListTile(
            context,
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Row(
            children: [
              Icon(
                icon,
                size: 28,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> fetchUserName(String userId) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('user_profiles')
          .doc(userId)
          .get();
      return userDoc['userName'];
    } catch (e) {
      // ignore: avoid_print
      print("Error fetching user name: $e");
      return "Unknown User";
    }
  }
}
