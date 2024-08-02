import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideco_app/home/HomePage/projectSelection.dart';

class PartnerSelectionScreen extends StatelessWidget {
  final List<String> partners = ["DP Unity", "Demo"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn đối tác'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: partners.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(partners[index]),
            onTap: () => Get.to(() => ProjectSelectionScreen()),
            trailing: Icon(Icons.chevron_right),
          );
        },
      ),
    );
  }
}
