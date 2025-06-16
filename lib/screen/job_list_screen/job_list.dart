import 'package:car_wash_app/temp_database/temp_database.dart';
import 'package:flutter/material.dart';

class JobList extends StatefulWidget {
  const JobList({super.key});

  @override
  State<JobList> createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Job Listings"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(child: Text("Done")),
              Tab(child: Text("In Progress")),
              Tab(child: Text("Canceled")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: customerDetails.length,
                itemBuilder: (context, index) {
                  final details = customerDetails[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            "assets/${details['vehicleimg']}",
                            height: 160,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(child: Text(details['name'])),
                      ],
                    ),
                  );
                },
              ),
            ),
            Text("Data 2"),
            Text("Data 3"),
          ],
        ),
      ),
    );
  }
}
