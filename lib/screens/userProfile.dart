import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:festive_care_cure/service/users_profile_data.dart';
import 'package:firebase_auth/firebase_auth.dart'; // For current user

class UserProfileForm extends StatelessWidget {
  const UserProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
          backgroundColor: const Color.fromARGB(255, 72, 47, 18),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: UserProfileFormWidget(),
        ),
      ),
    );
  }
}

class UserProfileFormWidget extends StatefulWidget {
  const UserProfileFormWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserProfileFormWidgetState createState() => _UserProfileFormWidgetState();
}

class _UserProfileFormWidgetState extends State<UserProfileFormWidget> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCountry;
  String? selectedState;
  String? selectedDistrict;
  String? selectedTaluk;
  String? selectedPostalCode;
  String? userName;
  String? streetName;
  String? landmark;
  String? mobileNumber;
  String? alternatePhoneNumber;

  UserProfileService userProfileService = UserProfileService();

  final List<String> countries = ['India'];
  final Map<String, List<String>> states = {
    'India': ['Karnataka', 'Maharashtra', 'Tamil Nadu', 'Kerala', 'Delhi'],
  };
  final Map<String, List<String>> districts = {
    'Karnataka': ['Bangalore', 'Mysore', 'Hubli'],
    'Maharashtra': ['Mumbai', 'Pune', 'Nagpur'],
    'Tamil Nadu': ['Chennai', 'Coimbatore', 'Madurai'],
  };
  final Map<String, List<String>> taluks = {
    'Bangalore': ['North', 'South', 'East'],
    'Mysore': ['Mysore North', 'Mysore South'],
    'Hubli': ['Hubli East', 'Hubli West'],
  };
  final Map<String, List<String>> postalCodes = {
    'North': ['560001', '560002', '560003'],
    'South': ['560004', '560005'],
    'East': ['560006', '560007'],
  };

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              "User Name",
              TextInputType.text,
              true,
              icon: Icons.person,
            ),
            buildDropdownField(
              "Country",
              countries,
              selectedCountry,
              (value) {
                setState(() {
                  selectedCountry = value;
                  selectedState = null;
                  selectedDistrict = null;
                  selectedTaluk = null;
                  selectedPostalCode = null;
                });
              },
            ),
            if (selectedCountry != null)
              buildDropdownField(
                "State",
                states[selectedCountry!] ?? [],
                selectedState,
                (value) {
                  setState(() {
                    selectedState = value;
                    selectedDistrict = null;
                    selectedTaluk = null;
                    selectedPostalCode = null;
                  });
                },
              ),
            if (selectedState != null)
              buildDropdownField(
                "District",
                districts[selectedState!] ?? [],
                selectedDistrict,
                (value) {
                  setState(() {
                    selectedDistrict = value;
                    selectedTaluk = null;
                    selectedPostalCode = null;
                  });
                },
              ),
            if (selectedDistrict != null)
              buildDropdownField(
                "Taluk",
                taluks[selectedDistrict!] ?? [],
                selectedTaluk,
                (value) {
                  setState(() {
                    selectedTaluk = value;
                    selectedPostalCode = null;
                  });
                },
              ),
            if (selectedTaluk != null)
              buildDropdownField(
                "Postal Code",
                postalCodes[selectedTaluk!] ?? [],
                selectedPostalCode,
                (value) {
                  setState(() {
                    selectedPostalCode = value;
                  });
                },
              ),
            buildTextField(
              "Street Name",
              TextInputType.text,
              true,
            ),
            buildTextField("Landmark", TextInputType.text, false),
            buildTextField(
              "Mobile Number",
              TextInputType.number,
              true,
              maxLength: 10,
              icon: Icons.phone,
            ),
            buildTextField(
              "Alternate Phone Number",
              TextInputType.number,
              false,
              maxLength: 10,
              icon: Icons.phone_iphone,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() == true &&
                      selectedCountry != null &&
                      selectedState != null &&
                      selectedDistrict != null &&
                      selectedTaluk != null &&
                      selectedPostalCode != null) {
                    // Collect the user data
                    Map<String, dynamic> userProfileData = {
                      'userName': userName,
                      'country': selectedCountry,
                      'state': selectedState,
                      'district': selectedDistrict,
                      'taluk': selectedTaluk,
                      'postalCode': selectedPostalCode,
                      'streetName': streetName,
                      'landmark': landmark,
                      'mobileNumber': mobileNumber,
                      'alternatePhoneNumber': alternatePhoneNumber,
                    };

                    // Save the profile to Firestore using the instance method
                    final currentUser = FirebaseAuth.instance.currentUser;
                    if (currentUser != null) {
                      await userProfileService.saveUserProfile(
                          currentUser.uid, userProfileData);
                    } else {
                      // ignore: avoid_print
                      print('No user is logged in.');
                    }

                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form Submitted')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please complete all fields'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, TextInputType keyboardType, bool isRequired,
      {int? maxLength, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        maxLength: maxLength,
        decoration: InputDecoration(
          prefixIcon: icon != null ? Icon(icon) : null, // Add icons here
          labelText: label,
          labelStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255)), // White text
          border: const OutlineInputBorder(),
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 107, 115, 130)),
          ),
        ),
        validator: (value) {
          if (isRequired && (value == null || value.isEmpty)) {
            return '$label is required';
          }
          return null;
        },
        onChanged: (value) {
          if (label == "User Name") {
            userName = value;
          } else if (label == "Street Name") {
            streetName = value;
          } else if (label == "Landmark") {
            landmark = value;
          } else if (label == "Mobile Number") {
            mobileNumber = value;
          } else if (label == "Alternate Phone Number") {
            alternatePhoneNumber = value;
          }
        },
      ),
    );
  }

  Widget buildDropdownField(
    String label,
    List<String> items,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white), // White text
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 236, 243, 255)),
          ),
        ),
        value: selectedValue,
        items: items
            .map((item) =>
                DropdownMenuItem<String>(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
  }
}
