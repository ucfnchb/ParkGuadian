import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:park/hive_ext.dart';

import 'item_detail_page.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});
  @override
  State<StatefulWidget> createState() => _ReportsPageState();

}

class _ReportsPageState extends State<ReportsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Center(
          child: GestureDetector(
            child: const Icon(Icons.arrow_back, size: 30, color: Colors.black,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Reports', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w800),),
      ),
      body: ListView(
        children: [
          ...Hive.getData().map((e) {
            return GestureDetector(
              child: Column(
                children: [
                  _buildLabel('Issue Category:', '${e['email']}'),
                  _buildLabel('Latitude:', 'latitude:${e['latitude']}'),
                  _buildLabel('Longitude:', 'longitude:${e['longitude']}'),
                  _buildLabel('Issue Category:', '${e['category']}'),
                  _buildLabel('Email:', '${e['email']}'),
                  const Divider(color: Colors.black, indent: 20, endIndent: 20,),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => ItemDetailPage(data: e,)));
              },
            );
          }).toList()
        ],
      ),
    );
  }

  _buildLabel (String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.black),),
          Text(content, style: const TextStyle(fontSize: 14, color: Colors.black),)
        ],
      ),
    );
  }

}