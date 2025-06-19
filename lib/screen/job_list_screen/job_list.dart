import 'dart:io';

import 'package:car_wash_app/temp_database/temp_database.dart';
import 'package:car_wash_app/widgets/custom_btn_v2.dart';
import 'package:car_wash_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

class JobList extends StatefulWidget {
  const JobList({super.key});

  @override
  State<JobList> createState() => _JobListState();
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

class _JobListState extends State<JobList> {
  Color colorStat(Map<String, dynamic> details) {
    if (details['job_stat'] == 'pending') {
      return Colors.grey;
    } else if (details['job_stat'] == 'canceled') {
      return Colors.redAccent;
    } else if (details['job_stat'] == 'done') {
      return Colors.lightGreen;
    }
    return Colors.yellow;
  }

  List<Map<String, dynamic>> pending =
      customerDetails
          .where((details) => details['job_stat'] == 'pending')
          .toList();
  List<Map<String, dynamic>> inProgressJobs =
      customerDetails
          .where((details) => details['job_stat'] == 'in progress')
          .toList();
  List<Map<String, dynamic>> doneJobs =
      customerDetails
          .where((details) => details['job_stat'] == 'done')
          .toList();
  List<Map<String, dynamic>> canceledJobs =
      customerDetails
          .where((details) => details['job_stat'] == 'canceled')
          .toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: Duration(milliseconds: 300),
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Job Listings"),
          centerTitle: true,
          bottom: TabBar(
            dividerColor: Colors.lightBlueAccent,
            unselectedLabelStyle: TextStyle(color: Colors.grey.shade500),
            tabs: [
              Tab(child: Text("Pending")),
              Tab(child: Text("In Progress")),
              Tab(child: Text("Done")),
              Tab(child: Text("Canceled")),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                addListing();
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            //Tab 1
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: SizedBox(
                height: double.infinity,
                child: ListView.builder(
                  itemCount: pending.length,
                  itemBuilder: (context, index) {
                    final details = pending[index];
                    return buildJobDetails(details);
                  },
                ),
              ),
            ),
            //Tab 2
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: SizedBox(
                height: double.infinity,
                child: ListView.builder(
                  itemCount: inProgressJobs.length,
                  itemBuilder: (context, index) {
                    final details = inProgressJobs[index];
                    return buildJobDetails(details);
                  },
                ),
              ),
            ),
            //tab 3
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: SizedBox(
                height: double.infinity,
                child: ListView.builder(
                  itemCount: doneJobs.length,
                  itemBuilder: (context, index) {
                    final details = doneJobs[index];
                    return buildJobDetails(details);
                  },
                ),
              ),
            ),
            //tab 4
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: SizedBox(
                height: double.infinity,
                child: ListView.builder(
                  itemCount: canceledJobs.length,
                  itemBuilder: (context, index) {
                    final details = canceledJobs[index];
                    return buildJobDetails(details);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  pickColor() {
    Color _currentColor = Colors.green;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _currentColor,
              onColorChanged: (color) {
                _currentColor = color;
              },
              // ignore: deprecated_member_use
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            TextButton(
              child: Text('Select'),
              onPressed: () {
                Navigator.of(context).pop();
                print(_currentColor);
              },
            ),
          ],
        );
      },
    );
  }

  Future<DateTime?> pickDate() async {
    // ignore: unused_local_variable
    DateTime _setDate;
    final today = DateTime.now();
    final lastDate = DateTime(2099);

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: lastDate,
    );

    if (selectedDate != null) {
      setState(() {
        // Save or use the selected date
        _setDate = selectedDate;
      });
    }
    print(selectedDate);
    return selectedDate;
  }

  addListing() {
    return showBottomSheet(
      context: context,
      builder: (context) {
        String? selectedPerson;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Job Listing",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Form(
                child: Column(
                  spacing: 10,
                  children: [
                    Textfield(
                      textlabel: "Enter Customer Name",
                      keyboardType: TextInputType.name,
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: Textfield(
                            textlabel: "Telephone Number",
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              pickColor();
                            },
                            child: Text("Pick Color"),
                          ),
                        ),
                      ],
                    ),
                    Textfield(
                      textlabel: "Car Make & Model",
                      keyboardType: TextInputType.text,
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              pickDate();
                            },
                            child: Text("Pick Date"),
                          ),
                        ),
                        Expanded(
                          child: DropdownButton<String>(
                            value: selectedPerson,
                            hint: Text("Select Washer"),
                            isExpanded: true,
                            items: [
                              DropdownMenuItem(
                                value: "Pam",
                                child: Text("Pam"),
                              ),
                              DropdownMenuItem(
                                value: "Wim",
                                child: Text("Wim"),
                              ),
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedPerson = newValue;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: Textfield(
                            textlabel: "Amount Due",
                            texticon: Icon(Icons.attach_money_rounded),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              fileAdder();
                            },
                            child: Text("Add Car Image"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              CustomBtnV2(
                btntext: "Submit",
                bgcolor: Colors.white,
                isBoldtext: true,
                size: 16,
                textcolor: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }

  GestureDetector buildJobDetails(Map<String, dynamic> details) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.asset(
                    "assets/${details['vehicleimg']}",
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 1,
                  child: Icon(Icons.circle, color: colorStat(details)),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  "${details['name']}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "${details['car_make_model']}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("April 21, 2006"), Text("${details['washer']}")],
            ),
          ],
        ),
      ),
    );
  }
}
