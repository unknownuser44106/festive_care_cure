import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginSeller.dart';

class SignupSeller extends StatefulWidget {
  const SignupSeller({super.key});

  @override
  State<SignupSeller> createState() => _SignupSellerState();
}

class _SignupSellerState extends State<SignupSeller> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController businessNameController = TextEditingController();

  Future<void> signUpSeller() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Passwords do not match!",
          style: TextStyle(fontSize: 18.0),
        ),
      ));
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Seller account created successfully!",
          style: TextStyle(fontSize: 18.0),
        ),
      ));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginSeller()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.message ?? "An error occurred.",
          style: const TextStyle(fontSize: 18.0),
        ),
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
            const Text(
              "Seller Signup",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Create a seller account to start selling!",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: businessNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your business name';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Business Name",
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white70),
                        prefixIcon: Icon(
                          Icons.store,
                          color: Colors.white70,
                          size: 25.0,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white70),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white70,
                          size: 25.0,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white70),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white70,
                          size: 25.0,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white70),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.white70,
                          size: 25.0,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          signUpSeller();
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        const SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginSeller()),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 191, 16),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
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



// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'login.dart';

// class SignUpSeller extends StatefulWidget {
//   const SignUpSeller({Key? key}) : super(key: key);

//   @override
//   State<SignUpSeller> createState() => _SignUpSellerState();
// }

// class _SignUpSellerState extends State<SignUpSeller> {
//   final _formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final usernameController = TextEditingController();
//   final phoneController = TextEditingController();

//   bool isLoading = false;

//   Future<void> signUpSeller() async {
//     if (passwordController.text != confirmPasswordController.text) {
//       showSnackbar("Passwords do not match!");
//       return;
//     }

//     setState(() => isLoading = true);

//     try {
//       final signInMethods = await FirebaseAuth.instance
//           .fetchSignInMethodsForEmail(emailController.text.trim());

//       if (signInMethods.isNotEmpty) {
//         showSnackbar("The email is already registered. Try another one.");
//         return;
//       }

//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userCredential.user!.uid)
//           .set({
//         'username': usernameController.text.trim(),
//         'email': emailController.text.trim(),
//         'phone': phoneController.text.trim(),
//         'role': 'seller',
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       await userCredential.user!.sendEmailVerification();
//       showSnackbar(
//           "Registration successful! Please check your email to verify your account.");

//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => const Login()));
//     } on FirebaseAuthException catch (e) {
//       showSnackbar(e.message ?? "An error occurred.");
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   void showSnackbar(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 50.0),
//                 const Text("Seller Sign Up",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10.0),
//                 const Text("Register to start selling!",
//                     style: TextStyle(color: Colors.white70, fontSize: 18.0)),
//                 const SizedBox(height: 30.0),
//                 buildTextField(usernameController, "Username", Icons.person),
//                 buildTextField(emailController, "Email", Icons.email,
//                     validator: validateEmail),
//                 buildTextField(phoneController, "Phone Number", Icons.phone,
//                     validator: validatePhone),
//                 buildTextField(passwordController, "Password", Icons.lock,
//                     isPassword: true),
//                 buildTextField(confirmPasswordController, "Confirm Password",
//                     Icons.lock_outline,
//                     isPassword: true),
//                 const SizedBox(height: 30.0),
//                 GestureDetector(
//                   onTap: () {
//                     if (_formKey.currentState!.validate()) signUpSeller();
//                   },
//                   child: Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: isLoading
//                         ? const Center(
//                             child:
//                                 CircularProgressIndicator(color: Colors.black))
//                         : const Center(
//                             child: Text("Sign Up",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.bold))),
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 TextButton(
//                   onPressed: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => const Login())),
//                   child: const Text("Already have an account? Log in",
//                       style: TextStyle(color: Colors.white70)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(
//       TextEditingController controller, String hint, IconData icon,
//       {bool isPassword = false, String? Function(String?)? validator}) {
//     return Column(
//       children: [
//         TextFormField(
//           controller: controller,
//           obscureText: isPassword,
//           validator: validator ??
//               (value) => value!.isEmpty ? 'Please enter $hint' : null,
//           style: const TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             hintText: hint,
//             hintStyle: const TextStyle(color: Colors.white70),
//             prefixIcon: Icon(icon, color: Colors.white70),
//             border: const OutlineInputBorder(),
//           ),
//         ),
//         const SizedBox(height: 20.0),
//       ],
//     );
//   }

//   String? validateEmail(String? value) {
//     const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$';
//     if (value == null || !RegExp(emailRegex).hasMatch(value)) {
//       return 'Enter a valid email address';
//     }
//     return null;
//   }

//   String? validatePhone(String? value) {
//     const phoneRegex = r'^\d{10}\$';
//     if (value == null || !RegExp(phoneRegex).hasMatch(value)) {
//       return 'Enter a valid 10-digit phone number';
//     }
//     return null;
//   }
// }
