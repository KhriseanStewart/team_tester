import 'package:car_wash_app/temp_database/temp_database.dart';
import 'package:flutter/material.dart';

class WasherManagement extends StatelessWidget {
  const WasherManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add),
        title: Text("Manage Washers"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: washerManagement.length,
                itemBuilder: (context, index) {
                  final washers = washerManagement[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.person, size: 50),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(washers['name'], style: TextStyle(fontSize: 18)),
                                  Text(
                                    washers['uuid'],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.edit, size: 30),
                              Icon(Icons.remove, size: 30),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
