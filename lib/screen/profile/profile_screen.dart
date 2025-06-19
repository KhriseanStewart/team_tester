import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

fileAdder() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );

  if (result != null && result.files.single.path != null) {
    String path = result.files.single.path!;
    File imageFile = File(path);

    // Now, save or copy this file to your desired location
    // For example, save to app's documents directory
    // You can use path_provider to get app directories
    // Here's a simple example copying the file to a new location

    // Example: Save to a new location
    final newPath =
        '/storage/emulated/0/Download/$imageFile'; // Or any path you want
    await imageFile.copy(newPath);

    print('Image saved to $newPath');
  } else {
    print('No file selected');
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.check_rounded)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    fileAdder();
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.grey.shade300,
                            child: Icon(Icons.person, size: 80),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: EdgeInsets.all(4),
                            color: Colors.grey.shade300,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                padding: EdgeInsets.all(2),
                                color: Colors.white,
                                child: Icon(Icons.edit),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Khrisean Stewart',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '8766661111',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'tester1@gmail.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Prinz101',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
