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
        actions: [Icon(Icons.edit), Icon(Icons.remove)],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: null,
            ),
          ],
        ),
      ),
    );
  }
}
