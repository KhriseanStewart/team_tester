import 'package:car_wash_app/temp_database/temp_database.dart';
import 'package:flutter/material.dart';

class JobList extends StatefulWidget {
  const JobList({super.key});

  @override
  State<JobList> createState() => _JobListState();
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

  addListing() {
    return showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.grey.shade300,
          padding: EdgeInsets.all(10),
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
              spacing: 3,
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("April 21, 2006"),
                Text(
                  "${details['washer']}",
                  // style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
