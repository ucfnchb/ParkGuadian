import 'package:flutter/material.dart';

class ItemDetailPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const ItemDetailPage({super.key, required this.data});
  @override
  State<StatefulWidget> createState() => _ItemDetailPageState();

}

class _ItemDetailPageState extends State<ItemDetailPage> {
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
        title: const Text('Item Detail', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w800),),
      ),
      body: Column(children: [
        _buildLabel('Issue Category:', '${widget.data['email']}'),
        _buildLabel('Latitude:', 'latitude:${widget.data['latitude']}'),
        _buildLabel('Longitude:', 'longitude:${widget.data['longitude']}'),
        _buildLabel('Issue Category:', '${widget.data['category']}'),
        _buildLabel('Issue Description::', '${widget.data['desc']}'),
        _buildLabel('Email:', '${widget.data['email']}'),
        const Divider(color: Colors.black, indent: 20, endIndent: 20,),
      ],),
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