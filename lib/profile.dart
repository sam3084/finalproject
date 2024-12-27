import 'dart:typed_data';
import 'package:finalproject/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _ProfileState();
}

class _ProfileState extends State<profile> {
  Uint8List? image;
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  // Load the saved profile image
  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedImage = prefs.getString('profile_image');
    if (savedImage != null) {
      setState(() {
        image = Uint8List.fromList(savedImage.codeUnits);
      });
    }
  }

  // Save the selected image
  Future<void> _saveProfileImage(Uint8List img) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', String.fromCharCodes(img));
  }

  // Image selection
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
    _saveProfileImage(img); // Save the image for persistence
  }

  // Sign out function
  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: image != null
                        ? MemoryImage(image!) // Show the selected image
                        : const NetworkImage(
                        'https://cdn3.vectorstock.com/i/1000x1000/51/87/student-avatar-user-profile-icon-vector-47025187.jpg')
                    as ImageProvider,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent, // Semi-transparent background
                        shape: BoxShape.circle, // Makes the background circular
                      ),
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.mode_edit_outline_rounded,
                          color: Colors.black, // Icon color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text('${user!.email}'),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(24),
                child: SettingsGroup(
                  title: 'GENERAL',
                  children: <Widget>[
                    buildLogout(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLogout() => SimpleSettingsTile(
    title: 'Logout',
    subtitle: '',
    leading: Icon(Icons.logout, color: Colors.purple),
    onTap: () async {
      // Perform signout
      await signout();

      // Show SnackBar message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logged out successfully!'),
        ),
      );
    }, // End of onTap
  );
}
