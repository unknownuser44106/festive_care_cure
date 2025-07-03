import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festive_care_cure/service/users_profile_data.dart';

class UserProfilePage extends StatefulWidget {
  final String userId; // Pass the userId for fetching/updating data

  const UserProfilePage(
      {super.key, required this.userId, required String userName});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final UserProfileService _userProfileService = UserProfileService();

  // ignore: unused_field
  Map<String, dynamic> _userData = {}; // Holds the user profile data
  bool _isLoading = true; // Indicates loading state
  String _editingField = ""; // Tracks the field currently being edited

  // Form fields controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _talukController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _streetNameController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _alternatePhoneNumberController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  // Fetch user profile data
  Future<void> _fetchUserData() async {
    try {
      setState(() {
        _isLoading = true;
      });

      // Fetch the data from Firestore
      Map<String, dynamic>? data =
          await _userProfileService.getUserProfile(widget.userId);

      if (data != null) {
        setState(() {
          _userData = data;
          _nameController.text = data['userName'] ?? '';
          _countryController.text = data['country'] ?? '';
          _stateController.text = data['state'] ?? '';
          _districtController.text = data['district'] ?? '';
          _talukController.text = data['taluk'] ?? '';
          _postalCodeController.text = data['postalCode'] ?? '';
          _streetNameController.text = data['streetName'] ?? '';
          _landmarkController.text = data['landmark'] ?? '';
          _mobileNumberController.text = data['mobileNumber'] ?? '';
          _alternatePhoneNumberController.text =
              data['alternatePhoneNumber'] ?? '';
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Save updated data
  Future<void> _saveUserProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        Map<String, dynamic> updatedData = {
          'userName': _nameController.text,
          'country': _countryController.text,
          'state': _stateController.text,
          'district': _districtController.text,
          'taluk': _talukController.text,
          'postalCode': _postalCodeController.text,
          'streetName': _streetNameController.text,
          'landmark': _landmarkController.text,
          'mobileNumber': _mobileNumberController.text,
          'alternatePhoneNumber': _alternatePhoneNumberController.text,
        };

        await _userProfileService.saveUserProfile(widget.userId, updatedData);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile updated successfully!")),
        );
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update profile!")),
        );
      }
    }
  }

  // Build editable field
  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required String fieldName,
  }) {
    final isEditing = _editingField == fieldName;
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            enabled: isEditing, // Enable only the field being edited
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isEditing ? Colors.blue : Colors.grey,
                  width: 2.0,
                ),
              ),
              labelStyle: TextStyle(
                color: isEditing ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.edit, color: Colors.blue),
          onPressed: () {
            setState(() {
              _editingField = isEditing ? "" : fieldName; // Toggle editing
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableField(
                      label: "Name",
                      controller: _nameController,
                      fieldName: "name",
                    ),
                    SizedBox(height: 10),
                    _buildEditableField(
                      label: "Country",
                      controller: _countryController,
                      fieldName: "country",
                    ),
                    SizedBox(height: 10),
                    _buildEditableField(
                      label: "State",
                      controller: _stateController,
                      fieldName: "state",
                    ),
                    SizedBox(height: 10),
                    _buildEditableField(
                      label: "District",
                      controller: _districtController,
                      fieldName: "district",
                    ),
                    SizedBox(height: 10),
                    _buildEditableField(
                      label: "Taluk",
                      controller: _talukController,
                      fieldName: "taluk",
                    ),
                    SizedBox(height: 10),
                    _buildEditableField(
                      label: "Postal Code",
                      controller: _postalCodeController,
                      fieldName: "postalCode",
                    ),
                    SizedBox(height: 10),
                    _buildEditableField(
                      label: "Street Name",
                      controller: _streetNameController,
                      fieldName: "streetName",
                    ),
                    SizedBox(height: 10),
                    _buildEditableField(
                      label: "Landmark",
                      controller: _landmarkController,
                      fieldName: "landmark",
                    ),
                    SizedBox(height: 10),
                    _buildEditableField(
                      label: "Mobile Number",
                      controller: _mobileNumberController,
                      fieldName: "mobileNumber",
                    ),
                    SizedBox(height: 10),
                    _buildEditableField(
                      label: "Alternate Phone Number",
                      controller: _alternatePhoneNumberController,
                      fieldName: "alternatePhoneNumber",
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _saveUserProfile,
                      // ignore: sort_child_properties_last
                      child:
                          Text("Save Profile", style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
