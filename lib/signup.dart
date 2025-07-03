// //with admin and seller
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'login.dart';
// import 'package:festive_care_cure/admin_dashboard.dart';
// import 'package:festive_care_cure/admin_signup_screen.dart';
// import 'package:festive_care_cure/signupSeller.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   final TextEditingController usernameController = TextEditingController();

//   Future<void> signUpUser() async {
//     if (passwordController.text != confirmPasswordController.text) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content:
//             Text("Passwords do not match!", style: TextStyle(fontSize: 18.0)),
//       ));
//       return;
//     }
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text("Account created successfully!",
//             style: TextStyle(fontSize: 18.0)),
//       ));
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const Login()),
//       );
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(e.message ?? "An error occurred.",
//             style: const TextStyle(fontSize: 18.0)),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 50.0),
//             const Text("Create Account",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30.0,
//                     fontWeight: FontWeight.bold)),
//             const SizedBox(height: 10.0),
//             const Text("Sign up to get started!",
//                 style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w500)),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: usernameController,
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter a username' : null,
//                       style: const TextStyle(color: Colors.white),
//                       decoration: const InputDecoration(
//                         hintText: "Username",
//                         hintStyle:
//                             TextStyle(fontSize: 18.0, color: Colors.white70),
//                         prefixIcon: Icon(Icons.person,
//                             color: Colors.white70, size: 25.0),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(height: 20.0),
//                     TextFormField(
//                       controller: emailController,
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter your email' : null,
//                       style: const TextStyle(color: Colors.white),
//                       decoration: const InputDecoration(
//                         hintText: "Email",
//                         hintStyle:
//                             TextStyle(fontSize: 18.0, color: Colors.white70),
//                         prefixIcon: Icon(Icons.email,
//                             color: Colors.white70, size: 25.0),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(height: 20.0),
//                     TextFormField(
//                       controller: passwordController,
//                       obscureText: true,
//                       validator: (value) =>
//                           value!.isEmpty ? 'Please enter your password' : null,
//                       style: const TextStyle(color: Colors.white),
//                       decoration: const InputDecoration(
//                         hintText: "Password",
//                         hintStyle:
//                             TextStyle(fontSize: 18.0, color: Colors.white70),
//                         prefixIcon:
//                             Icon(Icons.lock, color: Colors.white70, size: 25.0),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(height: 20.0),
//                     TextFormField(
//                       controller: confirmPasswordController,
//                       obscureText: true,
//                       validator: (value) => value!.isEmpty
//                           ? 'Please confirm your password'
//                           : null,
//                       style: const TextStyle(color: Colors.white),
//                       decoration: const InputDecoration(
//                         hintText: "Confirm Password",
//                         hintStyle:
//                             TextStyle(fontSize: 18.0, color: Colors.white70),
//                         prefixIcon: Icon(Icons.lock_outline,
//                             color: Colors.white70, size: 25.0),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(height: 20.0),
//                     ElevatedButton(
//                       onPressed: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => AdminSignupScreen())),
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white),
//                       child: const Text("Sign Up as Admin",
//                           style:
//                               TextStyle(color: Colors.black, fontSize: 18.0)),
//                     ),
//                     const SizedBox(height: 10.0),
//                     ElevatedButton(
//                       onPressed: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => SignupSeller())),
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white),
//                       child: const Text("Sign Up as Seller",
//                           style:
//                               TextStyle(color: Colors.black, fontSize: 18.0)),
//                     ),
//                     const SizedBox(height: 30.0),
//                     GestureDetector(
//                       onTap: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const Login())),
//                       child: const Text("Login",
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 255, 191, 16),
//                               fontSize: 18.0)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'package:festive_care_cure/admin_dashboard.dart';
import 'package:festive_care_cure/admin_signup_screen.dart';
import 'package:festive_care_cure/signupSeller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  Future<void> signUpUser() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
            Text("Passwords do not match!", style: TextStyle(fontSize: 18.0)),
      ));
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Account created successfully!",
            style: TextStyle(fontSize: 18.0)),
      ));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message ?? "An error occurred.",
            style: const TextStyle(fontSize: 18.0)),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50.0),
            const Text("Create Account",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            const Text("Sign up to get started!",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameController,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a username' : null,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Username",
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white70),
                        prefixIcon: Icon(Icons.person,
                            color: Colors.white70, size: 25.0),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: emailController,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your email' : null,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white70),
                        prefixIcon: Icon(Icons.email,
                            color: Colors.white70, size: 25.0),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your password' : null,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white70),
                        prefixIcon:
                            Icon(Icons.lock, color: Colors.white70, size: 25.0),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      validator: (value) => value!.isEmpty
                          ? 'Please confirm your password'
                          : null,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white70),
                        prefixIcon: Icon(Icons.lock_outline,
                            color: Colors.white70, size: 25.0),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    /// ✅ Sign Up Button Added
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signUpUser();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      child: const Text("Sign Up",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0)),
                    ),

                    const SizedBox(height: 20.0),

                    ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminSignupScreen())),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      child: const Text("Sign Up as Admin",
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupSeller())),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      child: const Text("Sign Up as Seller",
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                    ),
                    const SizedBox(height: 30.0),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login())),
                      child: const Text("Login",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 191, 16),
                              fontSize: 18.0)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
