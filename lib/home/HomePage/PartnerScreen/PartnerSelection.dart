import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ideco_app/home/HomePage/HomeScreen.dart';
import 'package:ideco_app/home/HomePage/ProjectScreen/projectSelection.dart';
import 'dart:convert';

class PartnerSelectionScreen extends StatefulWidget {
  @override
  _PartnerSelectionScreenState createState() => _PartnerSelectionScreenState();
}

class _PartnerSelectionScreenState extends State<PartnerSelectionScreen> {
  List<Map<String, dynamic>> partners = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> _getCustomer() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final response = await http.get(
        Uri.parse('https://bimnextapi-dev.dpunity.com/v2/customers'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> partnersData = data['data'];
        setState(() {
          partners = partnersData.map((partner) => {
            'name': partner['name'],
            'id': partner['_id']
          }).toList();
        });
      } else {
        setState(() {
          errorMessage = 'Lỗi API: ${response.statusCode}';
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Lỗi kết nối: $error';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getCustomer();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    print(arguments);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chọn đối tác',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
                ? Center(child: Text(errorMessage))
                : ListView.separated(
                    itemCount: partners.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          partners[index]['name'],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () { 
                          final updatedArguments = {
                            ...arguments, // Giữ nguyên các đối số cũ
                            'partnerName': partners[index]['name'] // Thêm partnerName mới
                          };
                          Get.to(() => ProjectSelectionScreen(), arguments: updatedArguments);},
                        trailing: Icon(Icons.chevron_right),
                      );
                    },
                  ),
      ),
    );
  }
}